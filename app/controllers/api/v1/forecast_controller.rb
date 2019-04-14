class Api::V1::ForecastController < ApplicationController
  def show
    geocode_info = GeocodeService.new(params[:location]).get_geocode
    forecast = Forecast.new(geocode_info).get_forecast
    render json: forecast
  end

end
