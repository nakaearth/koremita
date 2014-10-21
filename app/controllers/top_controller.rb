class TopController < ApplicationController
  skip_before_action :login?, only: :index

  def index
    @movies = Movie.page(params[:page]).per(20)
    @users = User.all
    gon.user_name = @users[0].name
  end
end
