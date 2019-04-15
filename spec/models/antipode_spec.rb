require 'rails_helper'


describe Antipode do
  describe 'instance methods' do
    before :each do
      @location = 'hongkong'
      @antipode = Antipode.new(@location)
    end

    it '#get_antipode' do
      antipode_data = @antipode.get_antipode
  
      expect(antipode_data[:lat]).to eq(-22.2901385)
      expect(antipode_data[:lng]).to eq(-65.5707852)
      expect(antipode_data[:location_name]).to eq("Yavi Department, Jujuy, Argentina")
    end

  end


end
