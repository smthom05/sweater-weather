require 'rails_helper'

describe 'Internal Background Image API' do
  it 'returns a background image for a given city' do
    get '/api/v1/backgrounds?location=denver,co'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    background_image_data = JSON.parse(response.body, symbolize_names: true)[:data][:attributes]

    expect(background_image_data).to be_a(Hash)
    expect(background_image_data).to have_key(:id)
    expect(background_image_data[:id]).to be_a(Integer)
    expect(background_image_data).to have_key(:photo_url)
    expect(background_image_data[:photo_url]).to be_a(String)
  end
end
