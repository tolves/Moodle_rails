# frozen_string_literal: true

module Admin
  class RoleAuthoritiesController < ApplicationController
    before_action :find_role

    def new
      @authority = @role.role_authorities.build
      fresh_when last_modified: @role.updated_at.utc, etag: @role
      @controllers = controllers

    end

    def create
      @role.role_authorities.create! role_authorities_params
      flash.notice = 'Attach Authorities Successful'
      redirect_to admin_role_path(@role) and nil
    rescue StandardError => e
      flash.alert = e
      redirect_to new_admin_role_role_authority_path(@role)
    end

    def destroy
      authority = @role.role_authorities.find(params[:id])
      @role.role_authorities.delete authority
      flash.notice = 'Remove Authority Successful'
    rescue StandardError => e
      flash.alert = e
    ensure
      redirect_to admin_role_path(@role)
    end

    def actions
      find_by_controller
    end

    private

    def find_by_controller
      controller = Object.const_get params[:select_controller]
      actions    = controller.action_methods.reject { |action| action.match(/check_permission|permissions/) }
      # authorities = RoleAuthority.select(:action_names).find_by(role_id: params[:role_id], controller_name: params[:select_controller])
      # actions - authorities if authorities
      respond_to do |format|
        format.json do
          render json: actions.to_json
        end
      end
    end

    def controllers
      controllers = []
      Dir[Rails.root.join('app/controllers/*_controller.rb')].each do |path|
        p = (path.match(/(\w+)_controller.rb/); Regexp.last_match(1)).camelize
        next if p == 'Application'

        controllers.push [p, p + 'Controller']
      end
      Dir[Rails.root.join('app/controllers/admin/*_controller.rb')].each do |path|
        p = (path.match(/(\w+)_controller.rb/); Regexp.last_match(1)).camelize
        controllers.push ['Admin::' + p, 'Admin::' + p + 'Controller']
      end
      controllers
    end

    def params_actions
      params.require(:role_authority).permit(:controller_name)
      params.require(:role_authority).require(:action_names).permit!
    end

    def role_authorities_params
      if params[:role_authority][:action_names]
        action_names = []
        params[:role_authority][:action_names].each { |key, value| action_names.push value }
      end

      {
        controller_name: params[:role_authority][:controller_name],
        action_names:    action_names
      }
    end

    def find_role
      @role = Role.find(params[:role_id])
    end
  end
end
