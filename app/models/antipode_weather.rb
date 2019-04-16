class AntipodeWeather

  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  def get_weather
    @weather_data ||= service.get_forecast
    {
      summary: @weather_data[:currently][:summary],
      current_temperature: @weather_data[:currently][:temperature]
    }
  end

  private

  def service
    DarkSkyService.new(@lat, @long)
  end


end
