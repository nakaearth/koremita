module Api
  class MoviesController < ApplicationController
    def index
      @movies = Movie.per(20).page(params[:page])
    end
  end
end
