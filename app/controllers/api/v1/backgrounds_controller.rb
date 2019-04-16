class Api::V1::BackgroundsController < ApplicationController

  def show
    background = Background.new(params[:location])
    render json: BackgroundsSerializer.new(background)
  end


end
