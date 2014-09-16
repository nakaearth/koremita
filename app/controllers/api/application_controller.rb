module Api
  class ApplicationController < ActionController::Base
    include Pundit
  
    before_action :login?
    helper_method :current_user

    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404
   
    def current_user
      api = ApiToken.find_by(access_token: params[:access_token])
      @current_use ||= api.user
    end

    def login?
      api = ApiToken.find_by(access_token: params[:access_token])
      true if api
    end

    def render_404
      render json: { status: ng }, status: :not_found
    end
  end
end
