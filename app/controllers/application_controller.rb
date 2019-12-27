class ApplicationController < ActionController::Base
  def check_on_present
    current_user.present?
    redirect_to root_path
  end
end
