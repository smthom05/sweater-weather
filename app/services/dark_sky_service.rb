class DarkSkyService
  attr_reader :lat,
              :lng

  def initialize(lat, lng)
    @lat = lat
    @lng = lng
  end

  def get_forecast
    forecast = JSON.parse(conn.body, symbolize_names: true)
  end


  private

  def conn
    Rails.cache.fetch("#{@lat},#{@lng}/#{Time.now.hour}/weather", expires_in: 1.hour) do
      Faraday.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_KEY']}/#{@lat},#{@lng}?exclude=minutely,alerts,flags") do |faraday|
        faraday.headers['Content-Type'] = 'application/json'
        faraday.headers['Accept'] = 'application/json'
      end
    end
  end
end
