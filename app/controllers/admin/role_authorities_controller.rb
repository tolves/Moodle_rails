class Admin::RoleAuthoritiesController < ApplicationController
  protect_from_forgery except: [:find_by_controller]

  def new
    @role      = Role.find(params[:role_id])
    @authority = @role.role_authorities.build
    # TODO: get all controllers and actions for selection

    @controllers = ApplicationController.descendants
  end

  def create; end

  def destroy; end

  def find_by_controller
    @actions = params[:controller]
    respond_to do |format|
      format.json do
        render json: {result: @actions.to_json}
      end
    end
  end
end
