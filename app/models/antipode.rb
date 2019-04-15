class Antipode
  attr_reader :id,
              :location_name,
              :forecast,
              :search_location

  def initialize(location)
    get_geocode_lat_lng(location)
    get_antipode
    @id = 1
  end

  def get_geocode_lat_lng(location)
    coordinates = geocode_service.get_geocode(location)
    @lat = coordinates[:lat]
    @lng = coordinates[:lng]
    @search_location = coordinates[:city]

  end

  def get_antipode
    antipode = amypode_service.find_antipode(@lat, @lng)
    @city_data = get_antipode_city_data(antipode[:attributes][:lat], antipode[:attributes][:long])
    weather_data = dark_sky_service.get_forecast
    @locaton_name = @city_data[:location_name]
    @forecast = {
      summary: weather_data[:currently][:summary],
      current_temperature: weather_data[:currently][:temperature]
    }
  end

  private

  def get_antipode_city_data(lat, lng)
    geocode_service.reverse_geocode(lat, lng)
  end

  def amypode_service
    AmypodeService.new
  end

  def geocode_service
    GeocodeService.new
  end

  def dark_sky_service
    DarkSkyService.new(@city_data[:lat],@city_data[:lng])
  end

end
