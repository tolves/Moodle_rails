module Permission
  extend ActiveSupport::Concern

  included do
    before_action :check_roles
    before_action :check_policies
  end

  private

  def roles(user)
    roles = {}
    if user_signed_in?
      user.role.role_authorities.each do |role|
        roles[role.controller_name] = role.action_names
      end
      roles
    end

    # {
    #   'products' => {
    #       :user => %i[index show]
    #   },
    #   'users' => {
    #       :user => %i[show update edit]
    #   },
    #   'admin' => {
    #   },
    #   'admin/products' => {
    #   },
    #   'admin/brands' => {
    #   },
    #   'admin/categories' => {
    #   },
    #   'admin/prices' => {
    #   }
    # }
  end

  def check_policies

  end

  def check_roles
    return if current_user.role.name == 'Administrator'
    user_roles    = roles current_user
    current_path  = controller_path.camelcase << 'Controller'
    current_roles = user_roles[current_path]

    unless current_roles&.include? action_name
      flash.alert = 'You do not have enough permission'
      redirect_to :root
    end
  end
end