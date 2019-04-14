class GeocodeService

  def initialize(location)
    @location = location
  end

  def get_geocode
    results = get_json("?address=#{@location}")
    get_info(results)
  end

  def get_info(data)
    {
      city: data[:address_components][0][:long_name],
      state: data[:address_components][2][:long_name],
      country: data[:address_components][3][:long_name],
      lat: data[:geometry][:location][:lat],
      lng: data[:geometry][:location][:lng]
    }
  end

  private

  def conn
    Faraday.new(url: "https://maps.googleapis.com/maps/api/geocode/json") do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers['Accept'] = 'application/json'
      faraday.params['key'] = ENV['GOOGLE_API_KEY']
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)[:results].first
  end

end
