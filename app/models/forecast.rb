class Forecast
  attr_reader :city,
              :state,
              :country,
              :lat,
              :lng

  def initialize(geocode_info)
    @city = geocode_info[:city]
    @state = geocode_info[:state]
    @country = geocode_info[:country]
    @lat = geocode_info[:lat]
    @lng = geocode_info[:lng]
  end

  def get_forecast
    service.get_forecast
  end

  private

  def service
    DarkSkyService.new(@lat, @lng)
  end

end
