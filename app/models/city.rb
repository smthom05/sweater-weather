class City < ApplicationRecord
  has_many :favorites
  has_many :users, through: :favorites

  validates_presence_of :name
  validates_presence_of :latitude
  validates_presence_of :longitude

  attr_reader :forecast

  def forecast
    Forecast.new(self[:name]).currently
  end

  def self.create_city(location)
    city_data = find_coordinates(location)
    City.create(name: location, latitude: city_data[:lat], longitude: city_data[:lng])
  end

  private

  def self.find_coordinates(location)
    city_data = service.get_geocode(location)
  end

  def self.service
    GeocodeService.new
  end

end
