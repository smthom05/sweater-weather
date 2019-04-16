class AntipodeLocation
  attr_reader :search_name,
              :city_data,
              :coordinates

  def initialize(location)
    get_geocode_lat_lng(location)
  end

  def get_geocode_lat_lng(location)
    coordinates ||= geocode_service.get_geocode(location)
    get_antipode(coordinates[:lat], coordinates[:lng])
    @search_name = coordinates[:city]
  end

  def get_antipode(search_lat, search_lng)
    antipode ||= amypode_service.find_antipode(search_lat, search_lng)
    @city_data = get_antipode_city_data(antipode[:lat], antipode[:long])
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
end
