require 'rails_helper'


describe AntipodeLocation do
  before :each do
    @location = 'hongkong'
  end
  it 'exists' do
    antipode_location = AntipodeLocation.new(@location)

    expect(antipode_location).to be_a(AntipodeLocation)
  end

  describe 'instance methods' do
    describe '#get_antipode' do
      it 'returns the city data for the antipode' do
        antipode_location = AntipodeLocation.new(@location)

        expect(antipode_location.city_data[:lat]).to eq(-22.2901385)
        expect(antipode_location.city_data[:lng]).to eq(-65.5707852)
        expect(antipode_location.location_name).to eq("Jujuy")
        expect(antipode_location.search_name).to eq("Hong Kong")

      end
    end

  end


end
