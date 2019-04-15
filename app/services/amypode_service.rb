class AmypodeService

  def find_antipode(lat, lng)
    response = Faraday.get("http://amypode.herokuapp.com/api/v1/antipodes?lat=#{lat}&long=#{lng}") do |faraday|
      faraday.headers['api_key'] = ENV['AMYPODE_API_KEY']
    end
    binding.pry
  end



  private

  def conn
    x= Faraday.get('http://amypode.herokuapp.com/api/v1/antipodes?lat=22.3193039&long=114.1693611') do |faraday|
      # faraday.adapter Faraday.default_adapter
      # faraday.headers['Content-Type'] = 'application/json'
      # faraday.headers['Accept'] = 'application/json'
      faraday.headers['api_key'] = ENV['AMYPODE_API_KEY']
    end
    binding.pry
  end

  def get_json(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
end
