class TopController < ApplicationController
  skip_before_action :login?, only: :index

  def index
    @movies = Movie.page(params[:page]).per(20)
    #TODO: ここにmovieの取得処理を記述
  end
end
