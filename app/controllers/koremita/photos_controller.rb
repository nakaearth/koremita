class Koremita::PhotosController < ApplicationController
  before_action :set_photo, only: [:new, :create] 
  before_action :set_movie, only: [:new, :create] 

  def new
  end

  def create
  end

  private
  def set_photo
    @photo = Photo.find(params[:id])
  end
  
  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

end
