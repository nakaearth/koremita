module Koremita
  class CommentsController < ApplicationController
    before_action :set_movie
    before_action :set_comment, only: [:show, :edit, :destroy]

    def index
      @comments = @movie.movie_comments.page(params[:page]).per(20)
    end

    def show
    end

    def new
      @comment = Comment.new
    end

    def create
      @comment = Comment.new
      redirect_to koremita_movie_comment_path(@comment)
    end

    def edit
      authorize @comment
    end

    def update
      authorize @comment
    end

    def destroy
      authorize @comment
      redirect_to koremita_movie_comments_path 
    end

    def set_movie
      @movie = Movie.find(params[:movie_id])
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
  end
end
