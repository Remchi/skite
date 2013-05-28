class SessionsController < Devise::SessionsController
  def create
    unless (params[:email] && params[:password]) || (params[:remember_token])
      return invalid_params("Credentials are wrong")
    end

    if params[:remember_token]
      token = params[:remember_token]
      id, identifier = token.split('-')
      user = User.serialize_from_cookie(id, identifier)
    else
      res = User.find_for_database_authentication(email: params[:email])
      if res && res.valid_password?(params[:password])
        user = res
      end
    end

    return invalid_params("Credentials are wrong") unless user

    user.ensure_authentication_token!

    data = {
      auth_token: user.authentication_token
    }
    if params[:remember] == 'true'
      user.remember_me!
      cookie = User.serialize_into_cookie(user)
      data[:remember_token] = "#{cookie.first.first}-#{cookie.last}"
    end

    render json: data, status: 201
  end

  protected

  def invalid_params(errorMessage)
    warden.custom_failure!
    render json: { errorMessage: errorMessage }, status: 403
  end
end