class UserSessionsController < ApplicationController
  before_action :check_on_present, except: :destroy

  def new
    @user = User.new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path, notice: 'Login successful'
    else
      flash.now[:alert] = 'Email or password was invalid'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'Logged out!'
  end
end

