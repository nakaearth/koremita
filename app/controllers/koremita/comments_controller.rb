module Koremita
  class CommentsController < ApplicationController
    before_action :set_movie
    before_action :set_comment, only: [:edit, :destroy]

    def index
      @comments = @movie.movie_comments.page(params[:page]).per(20)
    end

    def new
      @comment = Comment.new
    end

    def create
      comment = Comment.new(comment_params)
      comment.save!
      redirect_to koremita_movie_path(@movie)
    end

    def edit
      authorize @comment
    end

    def update
      authorize @comment
    end

    def destroy
      authorize @comment
      redirect_to koremita_movie_path(@movie)
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:message, :movie_id) if params[:comment]
    end
  end
end
