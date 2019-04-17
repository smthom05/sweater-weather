require 'rails_helper'

describe City do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :latitude}
    it {should validate_presence_of :longitude}
  end

  describe 'relationships' do
    it {should have_many :favorites}
    it {should have_many(:users).through :favorites}
  end

  describe 'instance methods' do
    describe '#forecast' do
      it 'creates a new forecast model with the forecast for a location' do
        city = City.create(name: 'denver,co', latitude: 39.7392358, longitude: -104.990251)

        expected = city.current_weather

        expect(expected.summary).to be_a(String)
        expect(expected.temperature).to be_a(Float)
      end
    end
  end

  describe 'class methods' do
    describe '.create_city' do
      it 'creates a city of its not in the database yet' do
        location = "denver,co"

        city = City.create_city(location)

        expect(City.count).to eq(1)
      end
    end
  end


end
