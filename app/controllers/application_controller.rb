class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound , with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404


  def authenticate_user!
#    session[:user_return_to] = env['PATH_INFO']
    redirect_to user_omniauth_authorize_path(:facebook) unless user_signed_in?
  end

  def render_404
    rednder :file => "#{Rails.root}/public/404.html", status: 404
  end
end
