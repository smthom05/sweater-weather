class Api::V1::AntipodeController < ApplicationController

  def show
    antipode = Antipode.new(params[:location])
    render json: antipode
  end


end
