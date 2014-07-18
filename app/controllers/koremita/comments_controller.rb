class Koremita::CommentsController < ApplicationController
  before_action: :set_comment 

  def show
    authorize @comment
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
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
