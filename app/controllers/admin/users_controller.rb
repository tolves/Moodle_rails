class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create; end

  def edit
    @user = User.find(params[:id])
    @minimum_password_length = 6

  end

  def update
    user = User.find(params[:id])
    flash.notice, path = if account_update_params[:password].blank?
                           if update_skip_password user, account_update_params
                             ["Change User: #{user.email} Profile Without Password Successful", admin_user_path(user.id)]
                           else
                             [user.errors, edit_admin_user_path(user.id)]
                           end
                         else
                           if user.update(account_update_params)
                             ["Change User: #{user.email} Profile Successful", admin_user_path(user.id)]
                           else
                             [user.errors, edit_admin_user_path(user.id)]
                           end
                         end
    redirect_to path

    # self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    # prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)
    #
    # resource_updated = update_resource(resource, account_update_params)
    # yield resource if block_given?
    # if resource_updated
    #   set_flash_message_for_update(resource, prev_unconfirmed_email)
    #   bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?
    #
    #   respond_with resource, location: after_update_path_for(resource)
    # else
    #   clean_up_passwords resource
    #   set_minimum_password_length
    #   respond_with resource
    # end

  end

  def destroy; end

  private

  def account_update_params
    attrs = %i[password password_confirmation current_password givenname surname role]
    params.require(:user).permit(attrs)
  end

  def update_skip_password(user, params, *options)
    params.delete(:password)
    user.update(params, *options)
  end
end
