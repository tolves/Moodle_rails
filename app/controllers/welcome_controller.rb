class WelcomeController < ApplicationController
  skip_before_action :check_roles
  skip_before_action :check_policies

  def index

  end
end
