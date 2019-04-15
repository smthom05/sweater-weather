require 'rails_helper'

describe 'GeocodingService' do
  it 'exists' do
    geo_serv = GeocodeService.new

    expect(geo_serv).to be_a(GeocodeService)
  end
  it 'gets lat and long from a location' do
    location = 'denver,colorado'
    geo_serv = GeocodeService.new

    data = geo_serv.get_geocode(location)

    expect(data[:city]).to eq('Denver')
    expect(data[:state]).to eq('CO')
    expect(data[:country]).to eq('United States')
    expect(data[:lat]).to eq(39.7392358)
    expect(data[:lng]).to eq(-104.990251)
  end
end
