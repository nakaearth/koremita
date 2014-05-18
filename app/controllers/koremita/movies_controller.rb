class Koremita::MoviesController < ApplicationController

  def index
    @movies = Movie.page(params[:page]).per(20)
  end

  def my_movies
    current_user.movies
  end
end
