class AmypodeService

  def find_antipode(lat, lng)
    response = get_json("antipodes?lat=#{lat}&long=#{lng}")[:data]
  end

  private

  def conn
    Faraday.new(url: 'http://amypode.herokuapp.com/api/v1') do |faraday|
      faraday.adapter Faraday.default_adapter
      faraday.headers['api_key'] = ENV['AMYPODE_API_KEY']
    end
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
