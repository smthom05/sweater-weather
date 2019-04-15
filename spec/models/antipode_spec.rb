require 'rails_helper'


describe Antipode do
  describe 'instance methods' do
    before :each do
      @location = 'hongkong'
      @antipode = Antipode.new(@location)
    end

    it '#get_antipode' do
      antipode_data = @antipode.get_antipode

      expect(antipode_data[attributes][:lat]).to eq(-22.3193039)
      expect(antipode_data[attributes][:long]).to eq(-65.8306389)
    end

    it '#get_antipode_city_data' do
      antipode_data = @antipode.get_antipode[:attributes]
      results = get_antipode_city_data(antipode_data[:lat], antipode_data[:long])
binding.pry
      expect(results[:location_name]).to eq("Yavi Department, Jujuy, Argentina")
    end

  end


end
