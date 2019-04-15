class Antipode

  def initialize(location)
    get_geocode_lat_lng(location)
  end

  def get_geocode_lat_lng(location)
    coordinates = geocode_service.get_geocode(location)
    @lat = coordinates[:lat]
    @lng = coordinates[:lng]
  end

  def get_antipode
    antipode = amypode_service.find_antipode(@lat, @lng)
    get_antipode_city_data(antipode[:attributes][:lat], antipode[:attributes][:long])
  end

  def get_antipode_city_data(lat, lng)
    geocode_service.reverse_geocode(lat, lng)
  end

  private

  def amypode_service
    AmypodeService.new
  end

  def geocode_service
    GeocodeService.new
  end

  def dark_sky_service
    DarkSkyService.new
  end

end
