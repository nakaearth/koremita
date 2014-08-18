class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  before_action :login?, :new_search_model
  helper_method :current_user
  rescue_from ActiveRecord::RecordNotFound, with: :render_404
  rescue_from ActionController::RoutingError, with: :render_404

  def current_user
    @current_user ||=  User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound => ar
    logger.info "ユーザ情報がありません: #{ar.message}"
    session[:user_id] = nil
    nil
  end

  def login?
    redirect_to :root if session[:user_id].blank?
  end

  def render_404
    render file: "#{Rails.root}/public/404.html", status: 404
  end

  def new_search_model
    @search_movie = SearchMovie.new
  end
end
