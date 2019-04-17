require 'rails_helper'

describe 'Internal Forecast API' do
  it 'will return forecast information for a given city' do
    get '/api/v1/forecast?location=denver,colorado'

    expect(response).to be_successful

    forecast_data = JSON.parse(response.body, symbolize_names: true)[:data]
    
    expect(forecast_data[:attributes][:city]).to eq("Denver")
    expect(forecast_data[:attributes][:state]).to eq("CO")
    expect(forecast_data[:attributes][:country]).to eq("United States")
    expect(forecast_data[:attributes][:currently]).to have_key(:summary)
    expect(forecast_data[:attributes][:currently]).to have_key(:precip_prob)
    expect(forecast_data[:attributes][:currently]).to have_key(:temperature)
    expect(forecast_data[:attributes][:currently]).to have_key(:humidity)
    expect(forecast_data[:attributes][:currently]).to have_key(:wind_speed)
    expect(forecast_data[:attributes][:currently]).to have_key(:visibility)
  end
end
