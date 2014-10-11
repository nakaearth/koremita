class TopController < ApplicationController
  skip_before_action :login?, only: :index

  def index
    @latest_movies = Movie.page(params[:page]).per(20)
    gon.json
    render json: @latest_movies.to_json
  end
end
