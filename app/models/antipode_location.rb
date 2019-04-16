class AntipodeLocation
  attr_reader :location_name,
              :forecast,
              :search_name,
              :city_data,
              :antipode,
              :coordinates

  def initialize(location)
    get_geocode_lat_lng(location)
    get_antipode
  end

  def get_geocode_lat_lng(location)
    coordinates ||= geocode_service.get_geocode(location)
    @search_lat = coordinates[:lat]
    @search_lng = coordinates[:lng]
    @search_name = coordinates[:city]
  end

  def get_antipode
    antipode ||= amypode_service.find_antipode(@search_lat, @search_lng)
    @city_data ||= get_antipode_city_data(antipode[:attributes][:lat], antipode[:attributes][:long])
    @location_name = @city_data[:location_name]
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
