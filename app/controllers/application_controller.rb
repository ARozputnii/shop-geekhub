class ApplicationController < ActionController::Base
  def check_on_present
    redirect_to root_path if current_user.present?
  end
end
