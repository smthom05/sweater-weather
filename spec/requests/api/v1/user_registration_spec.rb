require 'rails_helper'

describe 'User Register API' do
  describe 'as a visitor' do
    it 'creates a user on the database and generates a random api key' do
      body = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
        }

      expect(User.count).to eq(0)

      post '/api/v1/users', params: body

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(201)
      expect(result).to have_key(:api_key)
      expect(User.count).to eq(1)
    end

    it 'gives an error if the email has been taken' do
      taken_email = {
        "email": "whatever@example.com",
        "password": "password",
        "password_confirmation": "password"
        }
        post '/api/v1/users', params: taken_email

        expect(response.status).to eq(201)

        post '/api/v1/users', params: taken_email

        expect(response.status).to eq(409)
    end
  end
end
