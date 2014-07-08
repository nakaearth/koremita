module Koremita
  class MoviesController < ContentsController
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
      register =  MovieRegister.new(current_user)
      movie = register.regist_movie(movie_params, movie_youtub_params)
      if movie
        redirect_to action: :show, id: movie.id,  notice: 'movie data rec'
      else
        render action: :new
      end
    end

    private

    def movie_params
      params.require(:movie).permit(:title, :photo, :photo_cache,  :description, :view_flag, :rate)
    end

    def movie_youtub_params
      params.require(:youtub).permit(:title, :url) if params[:youtub]
    end
  end
end
