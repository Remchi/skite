class SessionsController < Devise::SessionsController
  def create
    render json: { auth_token: 'hello' }, status: 201
  end
end