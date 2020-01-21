class ApplicationController < ActionController::Base
  before_action :set_locale

  def admin_verify
    redirect_to root_path unless current_user&.admin?
  end

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
