module Api
  class MoviesController < ApiApplicationController
    def index
      @movies = Movie.page(params[:page]).per(20)
      render json: @movies.to_json
    end
  end
end
