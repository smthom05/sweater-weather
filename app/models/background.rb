class Background
  attr_reader :id,
              :location_data,
              :photo_url,
              :photo_hash

  def initialize(city_state)
    @id = 1
    @location_data = geocode_service.get_geocode(city_state)
    @photo_url ||= flickr_service.get_photo
  end

  private

  def flickr_service
    FlickrService.new(@location_data)
  end

  def geocode_service
    GeocodeService.new
  end

end
