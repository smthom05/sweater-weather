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
    describe '#get_antipode' do
      it 'returns the weather and city data for the antipode' do
        antipode = Antipode.new(@location)

        expect(antipode.city_data[:lat]).to eq(-22.2901385)
        expect(antipode.city_data[:lng]).to eq(-65.5707852)
        expect(antipode.location_name).to eq("Jujuy")
        expect(antipode.search_location).to eq("Hong Kong")

      end
    end

  end


end
