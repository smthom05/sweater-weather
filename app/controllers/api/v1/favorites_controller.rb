class Api::V1::FavoritesController < Api::V1::BaseController

  def create
    user = User.find_by(api_key: params[:api_key])
    city = City.find_by(name: params[:location]) || City.create_city(params[:location])

    if user
      user.cities << city
      render status: 201, json: { success: "You have added #{city.name} to your favorites!"}
    else
      render status: 401, json: { error: "API Key credentials are invalid."}
    end
  end

  def index
    user = User.find_by(api_key: params[:api_key])
    if user
      render status: 200, json: FavoritesSerializer.new(user.cities)
    else
      render status: 401, json: { error: "API Key credentials are invalid."}
    end
  end

  def destroy
    user = User.find_by(api_key: params[:api_key])
    city = City.find_by(name: params[:location])
    if user && city
      favorite = Favorite.find_by(user_id: user.id, city_id: city.id)
      favorite.destroy
      render status: 200, json: FavoritesSerializer.new(user.cities)
    else
      render status: 401, json: { error: "API Key credentials are invalid."}
    end
  end

end
