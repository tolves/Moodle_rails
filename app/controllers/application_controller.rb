class ApplicationController < ActionController::Base
  include Permission
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :flash_format

  protected

  def configure_permitted_parameters
    sign_up_attrs = %i[email password password_confirmation current_password givenname surname role]
    devise_parameter_sanitizer.permit(:sign_up, keys: sign_up_attrs)

    account_update_attrs = %i[password password_confirmation current_password givenname surname role]
    devise_parameter_sanitizer.permit(:account_update, keys: account_update_attrs)
  end

  def flash_format
    unless alert.blank?
      flash[:warning] = alert
      flash.delete(:alert)
    end
    unless notice.blank?
      flash[:primary] = notice
      flash.delete(:notice)
    end
  end
end
