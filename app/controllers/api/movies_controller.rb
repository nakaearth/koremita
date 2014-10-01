module Api
  class MoviesController < ApiApplicationController
    def index
      @movies = Movie.page(params[:page]).per(20)
    end
  end
end
