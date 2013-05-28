class SessionsController < Devise::SessionsController
  def create
    unless params[:email] && params[:password]
      return invalid_params('You need to provide both email and password')
    end

    res = User.find_for_database_authentication(email: params[:email])

    if res && res.valid_password?(params[:password])
      user = res
    end

    return invalid_params('Credentials are wrong') unless user

    user.ensure_authentication_token!
    render json: { auth_token: user.authentication_token }, status: 201
  end

  protected

  def invalid_params(errorMessage)
    warden.custom_failure!
    render json: { errorMessage: errorMessage }, status: 403
  end
end