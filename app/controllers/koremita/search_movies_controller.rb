module Koremita
  class SearchMoviesController < ApplicationController
    def create
      repository = Search::Connection.connect
      @results = repository.search(params[:search_movie][:title]) unless Rails.env.test?
      @results = [] if Rails.env.test?
      @search_movie = SearchMovie.new
    end

    private

    def search_keyword_params
      params.require(:search_movie).permit(:title) if params[:search_movie]
    end
  end
end
