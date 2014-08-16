module Koremita
  class MoviesController < ContentsController
    before_action :set_movie, only: [:show, :edit, :update]

    def index
      @movies = Movie.page(params[:page]).per(20)
    end

    def my_movies
      @movies = current_user.movies
    end

    def show
      @comment = Comment.new
      @comments = @movie.movie_comments.page(params[:page]).per(3)
    end

    def new
      @movie = Movie.new
    end

    def create
      register =  MovieRegister.new(current_user)
      movie = register.regist_movie(movie_params, movie_youtub_params)
      if movie
        search_engine movie
        redirect_to action: :show, id: movie.id,  notice: 'movie data rec'
      else
        render action: :new
      end
    end

    def edit
    end

    def update
      ActiveRecord::Base.transaction do
        @movie.update(movie_params)
      end
    end

    private

    def movie_params
      params.require(:movie).permit(:title, :photo, :photo_cache,  :description, :view_flag, :rate) if params[:movie]
    end

    def movie_youtub_params
      params.require(:youtub).permit(:title, :url) if params[:youtub]
    end

    def set_movie
      @movie = Movie.find(params[:id])
    end

    def search_engine(movie)
      es = Search::Movie.new
      es.index movie, 'koremita_app'
    end
  end
end
