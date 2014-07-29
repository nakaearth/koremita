module Koremita
  class CommentsController < ApplicationController
    before_action :set_comment

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

    def set_comment
      @comment = Comment.find(params[:id])
    end
  end
end
