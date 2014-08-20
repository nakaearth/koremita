require 'search/movie'

module Koremita
  class SearchMoviesController < ApplicationController
    def create
      @results = Search::Movie.new.search search_keyword_params unless Rails.env.test?
      @results = []
      @search_movie = SearchMovie.new
    end

    private

    def search_keyword_params
      params.require(:search_movie).permit(:keyword) if params[:search_movie]
    end
  end
end
