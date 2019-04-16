class Antipode
  attr_reader :id,
              :search_location,
              :forecast,
              :antipode_location,
              :location_name

  def initialize(location)
    @id = 1
    @antipode_location = get_antipode_location_data(location)
    @forecast = get_forecast
  end

  def get_antipode_location_data(location)
    AntipodeLocation.new(location)
  end

  def get_forecast
    AntipodeWeather.new(@antipode_location.city_data[:lat], @antipode_location.city_data[:lng]).get_weather
  end

  def location_name
    @antipode_location.city_data[:location_name]
  end

  def search_location
    @antipode_location.search_name
  end
end
