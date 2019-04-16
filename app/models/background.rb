class Background

  def initialize(city_state)
    @city_state = city_state
  end

  def get_lat_long
    geocode_service.get_geocode(@city_state)
  end




  private

  def flickr_service
    FlickrService.new
  end

  def geocode_service
    GeocodeService.new
  end

end
