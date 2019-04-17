class FavoritesSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :location, :current_weather
end
