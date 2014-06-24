class TopController < ApplicationController
  skip_before_filter :login?, only: :index

  def index
    @movies = Movie.page(params[:page]).per(20)
  end
end
