module Koremita
  module Search
    class MovieController < ApplicationController
      def search
        @results = Search::Movie.new.search search_keyword_params
      end

      private

      def search_keyword_params
        params.require(:search_movie).permit(:keyword) if params[:search_movie]
      end
    end
  end
end
