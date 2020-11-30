class Admin::UsersController < ApplicationController
  def index
    @users = User.all.order(:id)
    @header_title = :browser_users
  end

  def show
    @user = User.find(params[:id])
    @header_title = :user_details
  end

  def new
    @user = User.new
    @header_title = :add_a_new_user
  end

  def create; end

  def edit
    @user = User.find(params[:id])
    @minimum_password_length = 6
    @header_title = :edit_profile
  end

  def update
    user = User.find(params[:id])
    path = if account_update_params[:password].blank?
             if update_skip_password user, account_update_params
               flash[:success] = t('.success', email: user.email)
               admin_user_path(user)
             else
               flash[:warning] = user.errors.messages
               edit_admin_user_path(user)
             end
           else
             if user.update(account_update_params)
               flash[:success] = t('.success', email: user.email)
               admin_user_path(user)
             else
               flash[:warning] = user.errors.messages
               edit_admin_user_path(user)
             end
           end
    redirect_to path
  end

  def destroy; end

  private

  def account_update_params
    attrs = %i[password password_confirmation current_password givenname surname role_id avatar]
    params.require(:user).permit(attrs)
  end

  def update_skip_password(user, params, *options)
    params.delete(:password)
    user.update(params, *options)
  end
end
