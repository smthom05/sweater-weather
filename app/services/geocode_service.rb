class GeocodeService

  def get_geocode(city_and_state)
    results = get_json("?address=#{city_and_state}")
    get_lat_long(results)
  end

  def get_lat_long(data)
    {
      city: data[:address_components][0][:long_name],
      # state: data[:address_components][:short_name],
      # country: data[:address_components][3][:long_name],
      lat: data[:geometry][:location][:lat],
      lng: data[:geometry][:location][:lng]
    }
  end

  def reverse_geocode(lat, lng)
    results = get_json("?latlng=#{lat},#{lng}")
    reverse_geocode_info = {
      location_name: results[:address_components][1][:short_name],
      lat: results[:geometry][:location][:lat],
      lng: results[:geometry][:location][:lng]
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
