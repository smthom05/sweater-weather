require 'rails_helper'

describe 'User Favorites API' do
  describe 'as a logged in user' do
    before :each do
      @user = User.create(email: "whatever@example.com",
                         password: "password",
                         api_key: "jgn983hy48thw9begh98h4539h4")
    end

    describe 'I can attempt to add a city to my favorites' do
      it 'lets the user add a favorite city and returns a 201' do
        expect(Favorite.count).to eq(0)

        body = {
                  "location": "Denver, CO",
                  "api_key": "jgn983hy48thw9begh98h4539h4"
                }

        post '/api/v1/favorites', params: body

        expect(response).to be_successful
        expect(response.status).to eq(201)

        expect(Favorite.count).to eq(1)
      end

      it 'throws a 401 error if the api key is not present' do
        expect(Favorite.count).to eq(0)
        body = {"location": "Denver, CO"}

        post '/api/v1/favorites', params: body

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
        expect(Favorite.count).to eq(0)
      end

      it 'throws a 401 error if the api key is not correct' do
        expect(Favorite.count).to eq(0)
        body = {
                  "location": "Denver, CO",
                  "api_key": "nachoapikey"
                }

        post '/api/v1/favorites', params: body

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
        expect(Favorite.count).to eq(0)
      end
    end

    describe 'I can attempt to see my favorites' do
      it 'returns a 200 and list of favorited cities and their forecast details' do
        city_1 = @user.cities.create(name: 'Denver, CO')
        city_2 = @user.cities.create(name: 'Harrisburg, PA')
        city_3 = @user.cities.create(name: 'Blacksburg, VA')

        get '/api/v1/favorites', params: {api_key: @user.api_key}

        expect(response).to be_successful
        expect(response.status).to eq(200)

        results = JSON.parse(response.body, symbolize_names: true)
      end

      it 'returns a 401 if the api key is not present' do
        city_1 = @user.cities.create(name: 'Denver, CO')
        city_2 = @user.cities.create(name: 'Harrisburg, PA')
        city_3 = @user.cities.create(name: 'Blacksburg, VA')

        get '/api/v1/favorites', params: {}

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
      end

      it 'returns a 401 if the api key is not correct' do
        city_1 = @user.cities.create(name: 'Denver, CO')
        city_2 = @user.cities.create(name: 'Harrisburg, PA')
        city_3 = @user.cities.create(name: 'Blacksburg, VA')

        get '/api/v1/favorites', params: {api_key: 'nachoapikey'}

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
      end
    end

    describe 'I can attempt to delete one my favorite cities' do
      it 'returns a 200 and list of favorited cities without the deleted city' do
        city_1 = @user.cities.create(name: 'Denver, CO')
        city_2 = @user.cities.create(name: 'Harrisburg, PA')
        city_3 = @user.cities.create(name: 'Blacksburg, VA')

        expect(@user.cities.count).to eq(3)

        body = {
                  "location": "Denver, CO",
                  "api_key": "jgn983hy48thw9begh98h4539h4"
                }

        delete '/api/v1/favorites', params: body

        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(@user.cities.count).to eq(2)
      end

      it 'returns a 401 if the api key is not present' do
        city_1 = @user.cities.create(name: 'Denver, CO')
        city_2 = @user.cities.create(name: 'Harrisburg, PA')
        city_3 = @user.cities.create(name: 'Blacksburg, VA')

        delete '/api/v1/favorites', params: {'location': 'Denver, CO'}

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
        expect(@user.cities.count).to eq(3)
      end

      it 'returns a 401 if the api key is not correct' do
        city_1 = @user.cities.create(name: 'Denver, CO')
        city_2 = @user.cities.create(name: 'Harrisburg, PA')
        city_3 = @user.cities.create(name: 'Blacksburg, VA')

        body = {
                  'location': 'Denver, CO',
                  'api_key': 'nachoapikey'
                }

        delete '/api/v1/favorites', params: body

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
        expect(@user.cities.count).to eq(3)
      end
    end
  end
end
