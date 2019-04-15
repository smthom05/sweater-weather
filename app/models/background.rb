class Background

  def initialize(location)
    @location = location
  end

  



  private

  def flickr_service
    FlickrService.new
  end

  def geocode_service
    GeocodeService.new
  end

end
