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
      xit 'creates a new AntipodeLocation model that holds antipode city data' do
        results = Antipode.new(@location)

        expect(results.search_lat).to eq(22.3193039)
        expect(results.search_lng).to eq(114.1693611)
        expect(results.search_location).to be_a('Hong Kong')
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
