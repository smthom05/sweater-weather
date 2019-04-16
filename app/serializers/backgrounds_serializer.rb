class BackgroundsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :photo_url
end
