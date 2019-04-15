require 'rails_helper'

describe 'Antipode Service' do
  it 'will return the inputted citys antipode' do

    get '/api/v1/antipode?location=hongkong'

    results = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(response).to be_successful
    expect(results[:attributes][:location_name]).to eq("Yavi Department, Jujuy, Argentina")
    expect(results[:attributes][:forecast]).to have_key(:summary)
    expect(results[:attributes][:forecast][:summary]).to be_a(String)
    expect(results[:attributes][:forecast]).to have_key(:current_temperature)
    expect(results[:attributes][:forecast][:current_temperature]).to be_a(Float)
    expect(results[:attributes][:search_location]).to eq("Hong Kong")
  end
end
