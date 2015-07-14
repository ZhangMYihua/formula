class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_action :set_user_timezone

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(
      :email,
      :username,
      :time_zone,
      :password,
      :password_confirmation)
    }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(
      :email,
      :password,
      :password_confirmation,
      :current_password,
      :username,
      :time_zone
      )
    }
  end

  def set_user_timezone
    Time.zone = current_user.time_zone if current_user.present?
  end

end
