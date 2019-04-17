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
    expect(forecast.currently).to be_a(Currently)
    expect(forecast.hourly).to be_a(Hourly)
    # expect(forecast.daily).to be_a(Daily)
  end
end
