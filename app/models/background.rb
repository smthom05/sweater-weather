class Background
  attr_reader :id,
              :location_data,
              :photo_url,
              :photo_hash

  def initialize(city_state)
    @id = 1
    @location_data = geocode_service.get_geocode(city_state)
    @photo_hash ||= flickr_service.get_photo
  end

  def photo_url
    "https://farm#{@photo_hash['farm']}.staticflickr.com/#{@photo_hash['server']}/#{@photo_hash['id']}_#{@photo_hash['secret']}.jpg"
  end

  private

  def flickr_service
    FlickrService.new(@location_data)
  end

  def geocode_service
    GeocodeService.new
  end

end
