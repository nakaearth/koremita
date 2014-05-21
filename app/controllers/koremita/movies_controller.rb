
module Koremita
  class MoviesController < ApplicationController
    def index
      @movies = Movie.page(params[:page]).per(20)
    end

    def my_movies
      @movies = current_user.movies
    end

    def show
      @movie = Movie.find(params[:id])
    end

    def new
      @movie = Movie.new
    end

    def create
      @movie = Movie.new(movie_params)
      if @movie.save
        redirect_to action: :show, notice: 'movie data rec'
      else
        render action: :new
      end
    end

    private
    def movie_params
      params.require(:movie).permit(:title, :image_url, :description, :view_flag, :rate)   
    end
  end
end
