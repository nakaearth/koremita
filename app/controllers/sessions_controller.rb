class SessionsController < ApplicationController
  skip_before_action :login?, only: [:new, :create, :destroy, :oauth_failure]
  def new
    redirect_to '/auth/' + (Rails.env.production? ? params[:provider] : 'developer')
  end

  def create
    auth  = request.env["omniauth.auth"]
    service = UsersFactory.create_users(auth)
    user = service.find_user_by_provider_and_uid || service.create_account
    session[:user_id] = user.id
    logger.info user
    redirect_to controller: 'top', action: 'index', notice: 'login successfully.'
  end

  def destroy
    reset_session
    redirect_to controller: 'top', action: 'index', notice: 'login successfully.'
  end

  def oauth_failure
    flash[:notice] = "キャンセルしました。"
    redirect_to "/"
  end
end
