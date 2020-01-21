class Backoffice::BackofficeController < ActionController::Base
  before_action :admin_verify
  before_action :set_locale

  layout 'backoffice.html.erb'

  def admin_verify
    redirect_to root_path unless current_user&.admin?
  end
  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
end
