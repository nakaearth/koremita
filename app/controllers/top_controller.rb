class TopController < ApplicationController
  skip_before_filter :login?, only: :index

  def index
    @movies = Movie.all
  end
end
