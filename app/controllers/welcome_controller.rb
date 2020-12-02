class WelcomeController < ApplicationController

  def index
    @header_title = 'Welcome ' + current_user.role.name + ': ' + current_user.full_name
  end
end
