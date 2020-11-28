class Admin::RoleAuthoritiesController < ApplicationController

  def new
    @role        = Role.find(params[:role_id])
    @authority   = @role.role_authorities.build
    @controllers = controllers
  end

  def create; end

  def destroy; end

  def find_by_controller
    controller  = Object.const_get params[:select_controller]
    actions     = controller.action_methods.reject { |action| action.match(/check_permission|permissions/) }
    authorities = RoleAuthority.select(:action_names).find_by(role_id: params[:role_id], controller_name: params[:select_controller])
    actions - authorities if authorities
    respond_to do |format|
      format.json do
        render json: actions.to_json
      end
    end
  end

  def controllers
    controllers       = Dir[Rails.root.join('app/controllers/*_controller.rb')].map do |path|
      p = (path.match(/(\w+)_controller.rb/); $1).camelize
      [p, p + 'Controller']
    end
    admin_controllers = Dir[Rails.root.join('app/controllers/admin/*_controller.rb')].map do |path|
      p = (path.match(/(\w+)_controller.rb/); $1).camelize
      ['Admin::' + p, 'Admin::' + p + 'Controller']
    end
    controllers + admin_controllers
  end

  private

end
