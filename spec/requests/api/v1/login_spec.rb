require 'rails_helper'

describe 'Login API' do
  describe 'as a registered user who is logging back in' do
    it 'will validate password and return my api token' do
      user = User.create(email: "whatever@example.com",
                         password: "password",
                         api_key: "jgn983hy48thw9begh98h4539h4")

      post '/api/v1/sessions', params: {
        "email": "whatever@example.com",
        "password": "password"
      }

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(200)
      expect(result).to have_key(:api_key)
    end

    it 'will error out if you do not pass the correct password or email' do
      user = User.create(email: "whatever@example.com",
                         password: "password",
                         api_key: "jgn983hy48thw9begh98h4539h4")

      post '/api/v1/sessions', params: {"email": "whatever@example.com","password": "passwooorrdddd"}

      result = JSON.parse(response.body, symbolize_names: true)

      expect(response.status).to eq(409)
      expect(result).to have_key(:error)
      expect(result).to_not have_key(:api_key)
    end
  end
end
