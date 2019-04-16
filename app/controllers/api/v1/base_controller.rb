class Api::V1::BaseController < ActionController::API

  def bad_credentials
    {error: 'Credentials are not valid. Please try again.'}
  end
end
