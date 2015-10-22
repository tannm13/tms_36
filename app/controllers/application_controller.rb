class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :set_locale
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def authorize_supervisor
    unless current_user.is_supervisor?
      flash[:danger] = t "flashs.user.not_admin"
      redirect_to root_path
    end
  end

  def authorize_user
    unless logged_in?
      store_location
      flash[:danger] = t "flashs.user.not_login"
      redirect_to login_url
    end
  end
end
