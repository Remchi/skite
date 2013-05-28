class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def auth_only
    unless user_signed_in?
      render json: {}, status: 401
    end
  end
end
