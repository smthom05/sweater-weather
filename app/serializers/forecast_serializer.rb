class ForecastSerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,
             :city,
             :state,
             :country,
             :currently,
             :hourly,
             :daily
end
