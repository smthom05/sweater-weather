require 'rails_helper'


describe Antipode do
  before :each do
    @location = 'hongkong'
  end

  it 'exists' do
    antipode = Antipode.new(@location)

    expect(antipode).to be_a(Antipode)
  end

  describe 'instance methods' do
    describe '#get_antipode_location' do
      it 'creates a new AntipodeLocation model that holds antipode city data' do
        results = Antipode.new(@location)

        expect(results.antipode_location.city_data[:location_name]).to eq('Jujuy')
        expect(results.antipode_location.city_data[:lat]).to eq(-22.2901385)
        expect(results.antipode_location.city_data[:lng]).to eq(-65.5707852)
        expect(results.antipode_location.search_name).to eq('Hong Kong') 
      end
    end

    describe '#get_forecast' do
      it 'creates a new AntipodeWeather model that holds forecast' do
        antipode = Antipode.new(@location)

        results = antipode.get_forecast

        expect(results).to have_key(:summary)
        expect(results).to have_key(:current_temperature)
      end
    end
  end

end