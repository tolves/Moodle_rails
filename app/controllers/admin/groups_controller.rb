class Admin::GroupsController < ApplicationController
  def index
    @groups = Group.all
    @header_title = :browser_groups

  end

  def show
    @group = Group.find(params[:id])
    @header_title = :group_details
  end

  def new
    @group = Group.new
    @header_title = :add_a_new_group
  end

  def create
    @group = Group.new params_group
    @group.save!
    redirect_to admin_groups_path
    flash.notice = 'Add A New Group'
  rescue StandardError => e
    flash.alert = e
    redirect_to edit_admin_group_path(@group)
  end

  def edit
    @group = Group.find(params[:id])
    @header_title = :edit_group
  end

  def update
    @group = Group.find(params[:id])
    @group.update! params_group
    flash.notice = 'Update Group Successful'
    redirect_to admin_group_path(@group) and nil
  rescue StandardError => e
    flash.alert = e
    redirect_to edit_admin_group_path(@group)
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy!
    flash.notice = 'Remove Group Successful'
  rescue StandardError => e
    flash.alert = e
  ensure redirect_to admin_groups_path
  end


  private

  def params_group
    params.require(:group).permit(:name, :users)
  end
end
