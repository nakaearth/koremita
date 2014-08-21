require 'search/movie'

module Koremita
  class SearchMoviesController < ApplicationController
    def create
      # @results = Search::Movie.new.search(search_keyword_params, index_value: 'koremita_app') unless Rails.env.test?
      # @results = [] if Rails.env.test?
      # @search_movie = SearchMovie.new
      repository = Search::Connection.connect
      @results = repository.search(query: { match: { text: search_keyword_params } }) unless Rails.env.test?
      @results = [] if Rails.env.test?
      @search_movie = SearchMovie.new
    end

    private

    def search_keyword_params
      params.require(:search_movie).permit(:keyword) if params[:search_movie]
    end
  end
end
