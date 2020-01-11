class ApplicationController < ActionController::Base

  helper ActionText::Engine.helpers

  def check_on_present
    redirect_to root_path if current_user.present?
  end
end
