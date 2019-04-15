class Api::V1::BackgroundsController < ApplicationController

  def show
    background = Background.new
    render json: BackgroundSerializer.new(background)
  end


end
