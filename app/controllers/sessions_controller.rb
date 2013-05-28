class SessionsController < Devise::SessionsController
  def create
    res = User.find_for_database_authentication(email: params[:email])

    if res && res.valid_password?(params[:password])
      user = res
    end

    user.ensure_authentication_token!
    render json: { auth_token: user.authentication_token }, status: 201
  end
end