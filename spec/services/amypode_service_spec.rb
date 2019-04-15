require 'rails_helper'

describe 'Amypode API' do
  it 'exists' do
    amypode = AmypodeService.new

    expect(amypode).to be_a(AmypodeService)
  end
  it 'can get the antipode lat and long from a location' do
    lat = 22.3193039
    lng = 114.1693611
    amypode = AmypodeService.new

    geocode = amypode.find_antipode(lat, lng)

    expect(geocode[:type]).to eq('antipode')
    expect(geocode[:attributes][:lat]).to eq(-22.3193039)
    expect(geocode[:attributes][:long]).to eq(-65.8306389)
  end
end
