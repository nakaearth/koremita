module Api
  class ApplicationController < ActionController::Base
    # Prevent CSRF attacks by raising an exception.
    # For APIs, you may want to use :null_session instead.
    include Pundit
    helper_method :current_user
    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404

    def current_user
    end

    def render_404
      render json: { status: ng }, status: :not_found
    end
  end
end
