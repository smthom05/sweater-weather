require 'rails_helper'


describe AntipodeWeather do
  before :each do
    @lat = -22.2901385
    @long = -65.5707852
  end
  it 'exists' do
    antipode_weather = AntipodeWeather.new(@lat, @long)

    expect(antipode_weather).to be_a(AntipodeWeather)
  end

  describe 'instance methods' do
    describe '#get_weather' do
      it 'gets the summary and current temperature for a given lat and long' do
        antipode_weather = AntipodeWeather.new(@lat,@long)

        forecast = antipode_weather.get_weather

        expect(forecast).to have_key(:summary)
        expect(forecast[:summary]).to be_a(String)
        expect(forecast).to have_key(:current_temperature)
        expect(forecast[:current_temperature]).to be_a(Float)
      end
    end
  end
end
