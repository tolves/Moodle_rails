module Permission
  extend ActiveSupport::Concern

  private

  def check_policies
    puts 'aaaa'
  end

  def check_roles
    return if current_user.role.name == 'Administrator'
    return if controller_path.match /^users/
    return if controller_path == 'welcome'

    if include_controller?
      unless include_action?
        flash.alert = 'You do not have enough permission'
        redirect_to :root and nil
      end
    else flash.alert = 'You do not have enough permission'
    redirect_to :root
    end
  end

  def include_controller?
    !current_user.role.role_authorities.where(controller_name: controller_path.camelcase << 'Controller').blank?
  end

  def include_action?
    current_user.role.role_authorities.where(controller_name: controller_path.camelcase << 'Controller').first.action_names.include? action_name
  end
end