require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit the root path' do
    it 'shows me a field to enter my location and get weather back' do
      visit '/api/v1/forecast?location=denver,colorado'
    end
  end
end
