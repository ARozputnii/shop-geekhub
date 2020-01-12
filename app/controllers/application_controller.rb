class ApplicationController < ActionController::Base
  before_action :set_locale
  def check_on_present
    redirect_to root_path if current_user.present?
  end

  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
