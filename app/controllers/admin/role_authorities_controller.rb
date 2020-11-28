class Admin::RoleAuthoritiesController < ApplicationController
  protect_from_forgery except: [:find_by_controller]

  def new
    @role        = Role.find(params[:role_id])
    @authority   = @role.role_authorities.build
    @controllers = controllers
  end

  def create; end

  def destroy; end

  def find_by_controller
    controller = Object.const_get params[:select_controller]
    actions    = controller.action_methods
    respond_to do |format|
      format.json do
        render json: {result: actions.to_json}
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
