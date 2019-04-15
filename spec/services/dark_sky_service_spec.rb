require 'rails_helper'

describe 'DarkSkyService' do
  it 'exists' do
    lat = 39.7392358
    lng = -104.990251
    dss = DarkSkyService.new(lat, lng)

    expect(dss).to be_a(DarkSkyService)
  end

  it 'returns back forecast data for a given lat and long' do
    lat = 39.7392358
    lng = -104.990251
    dss = DarkSkyService.new(lat, lng)

    response = dss.get_forecast

    expect(response[:latitude]).to eq(39.7392358)
    expect(response[:longitude]).to eq(-104.990251)
    expect(response[:currently]).to be_a(Hash)
    expect(response[:currently]).to have_key(:temperature)
    expect(response[:hourly]).to be_a(Hash)
    expect(response[:daily]).to be_a(Hash)
  end

end
