class TopController < ApplicationController
  skip_before_filter :login?, only: :index

  def index
  end
end
