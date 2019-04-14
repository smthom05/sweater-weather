class Forecast
  attr_reader :id,
              :city_and_state,
              :city,
              :state,
              :country,
              :lat,
              :lng,
              :currently,
              :hourly,
              :daily

  def initialize(location_info)
    @id = 1
    @city_and_state = location_info
    @lat = request_geocode[:lat]
    @lng = request_geocode[:lng]
    @city = request_geocode[:city]
    @state = request_geocode[:state]
    @country = request_geocode[:country]
    @currently = request_forecast[:currently]
    @hourly = request_forecast[:hourly]
    @daily = request_forecast[:daily]
  end

  def request_forecast
    dark_sky_service.get_forecast
  end

  def request_geocode
    geocode_service.get_geocode(@city_and_state)
  end

  private

  def geocode_service
    GeocodeService.new
  end

  def dark_sky_service
    DarkSkyService.new(@lat, @lng)
  end

end
