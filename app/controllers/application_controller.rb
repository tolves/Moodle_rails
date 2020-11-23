class ApplicationController < ActionController::Base
  include Permission
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    sign_up_attrs = %i[email password password_confirmation current_password givenname surname role]
    devise_parameter_sanitizer.permit(:sign_up, keys: sign_up_attrs)

    account_update_attrs = %i[password password_confirmation current_password givenname surname role]
    devise_parameter_sanitizer.permit(:account_update, keys: account_update_attrs)
  end
end
