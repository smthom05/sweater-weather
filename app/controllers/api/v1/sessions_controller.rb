class Api::V1::SessionsController < Api::V1::BaseController

  def create
    user = User.find_by_email(params[:email])
    if user.authenticate(params[:password])
      render json: {api_key: user.api_key}, status: 200
    else
      render json: bad_credentials, status: 409
    end
  end
end
