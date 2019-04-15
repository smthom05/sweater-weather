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
    amypode_service.find_antipode(@lat, @lng)
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
