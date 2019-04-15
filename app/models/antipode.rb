class Antipode

  def initialize(location)
    @lat_lng = get_geocode_lat_lng(location)
  end

  def get_geocode_lat_lng(location)
    coordinates = geocode_service.get_geocode(location)
    @lat = coordinates[:lat]
    @lng = coordinates[:lng]
  end


  private

  def geocode_service
    GeocodeService.new
  end

  def dark_sky_service
    DarkSkyService.new
  end

end
