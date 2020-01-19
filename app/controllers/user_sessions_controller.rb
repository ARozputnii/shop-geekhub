class UserSessionsController < ApplicationController
  before_action :check_on_present, except: :destroy

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path, notice: t('controllers.sessions_controller.logged_in')
    else
      flash.now[:alert] = t('controllers.sessions_controller.failed')
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: t('controllers.sessions_controller.logget_out')
  end
end
