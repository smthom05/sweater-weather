class FavoritesSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id, :name
end
