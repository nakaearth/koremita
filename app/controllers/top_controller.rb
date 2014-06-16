class TopController < ApplicationController
  skip_before_filter :login?, only: :index

  def index
    @movies = MovieDecorator.page(params[:page]).per(20)
  end
end
