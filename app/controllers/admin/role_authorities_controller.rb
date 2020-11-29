# frozen_string_literal: true

module Admin
  class RoleAuthoritiesController < ApplicationController
    def new
      @role        = Role.find(params[:role_id])
      @authority   = @role.role_authorities.build
      @controllers = controllers
    end

    def create
      p params
    end

    def destroy; end

    def actions
      find_by_controller
    end

    private

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
  end
end
