module Koremita
  module Movie
    class CommentsController < ApplicationController
      before_action :set_comment

      def index
        @comments = @movie.comments.page(params[:page]).per(20)
      end

      def show
      end

      def new
        @comment = Comment.new
      end

      def create
        @comment = Comment.new
      end

      def edit
        authorize @comment
      end

      def update
        authorize @comment
      end

      def set_movie
        @movie = Movie.find(params[:movie_id])
      end

      def set_comment
        @comment = Comment.find(params[:id])
      end
    end
  end
end
