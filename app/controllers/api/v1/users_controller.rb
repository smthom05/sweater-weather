class Api::V1::UsersController < Api::V1::BaseController
  def create
    user = User.new(user_params)
    if user.save
      user_api_key = {api_key: SecureRandom.hex}
      user.update(user_api_key)
      render json: user_api_key, status: 201
    else
      render json: bad_credentials, status: 409
    end
  end


  private

  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
