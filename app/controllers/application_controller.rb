class ApplicationController < ActionController::Base
  include Permission
  before_action do
    authenticate_user!
    configure_permitted_parameters if devise_controller?
    flash_format
    if user_signed_in?
      check_roles
      header_links
      header_title
      left_menu
    end
  end


  protected

  def configure_permitted_parameters
    sign_up_attrs = %i[email password password_confirmation current_password givenname surname role_id avatar]
    devise_parameter_sanitizer.permit(:sign_up, keys: sign_up_attrs)

    account_update_attrs = %i[password password_confirmation current_password givenname surname role_id avatar]
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

  def header_links
    paths = request.path.split(%r{/})
    paths.shift
    @header_links = []
    while paths.size > 1 && paths.first
      paths.pop
      path = paths.join('_')
      if Rails.application.routes.url_helpers.method_defined?((path + '_path').to_sym)
        @header_links.push [paths.last => path]
      else next
      end
    end
    @header_links.reverse!
  end

  def header_title
    @header_title ||= 'Moodle Ruby On Rails'
  end

  def left_menu
    @my_courses = current_user.type_policies&.map do |u|
      u.policy.object
    end
  end
end
