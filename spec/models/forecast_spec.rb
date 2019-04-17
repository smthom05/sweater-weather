require 'rails_helper'

describe Forecast do
  it 'exists' do
    location = 'denver,co'
    forecast = Forecast.new(location)

    expect(forecast).to be_a(Forecast)
  end

  it 'has attributes' do
    location = 'denver,co'
    forecast = Forecast.new(location)

    expect(forecast.lat).to eq(39.7392358)
    expect(forecast.lng).to eq(-104.990251)
    expect(forecast.city).to eq('Denver')
    expect(forecast.state).to eq('CO')
    expect(forecast.country).to eq('United States')
    expect(forecast.forecast).to have_key(:currently)
    expect(forecast.forecast).to have_key(:hourly)
    expect(forecast.forecast).to have_key(:daily)
  end
end
