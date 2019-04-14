class Api::V1::ForecastController < ApplicationController
  def show
    forecast =  Forecast.new(params[:location])
    render json: ForecastSerializer.new(forecast)

    # geocode_info = GeocodeService.new(params[:location]).get_geocode
    # forecast = Forecast.new(geocode_info).get_forecast
    # render json: forecast
  end

end
