# frozen_string_literal: true

class AdminController < ApplicationController
  def index
    @tabs = admin_dashboard
    @header_title = 'Welcome ' + current_user.role.name + ': ' + current_user.full_name
    # OPTIMISE stable?
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def admin_dashboard
    { site_administration: { '': { 'notifications' => '', 'registration' => '', 'moodle_services' => '', 'feedback_settings' => '', 'advanced_features' => '' }, analytics: { 'site_information' => '', 'analytics_settings' => '', 'analytics_models' => '' }, language: { 'language_settings' => '', 'language_customisation' => '', 'language_packs' => '' }, location: { 'location_settings' => '' }, badges: { 'manage_badges' => '', 'add_new_badges' => '', 'badges_settings' => '' } }, users: { accounts: { 'browse_list_users' => admin_users_path, 'add_a_new_user' => new_admin_user_path, 'user_default_preferences' => '', 'User_customise_fields' => '' } }, groups: { groups: { 'browse_list_groups' => admin_groups_path, 'add_a_new_group' => new_admin_group_path } }, courses: { courses: { 'manage_courses' => courses_path, 'manage_courses_categories' => '', 'add_a_new_course' => new_course_path, 'course_custom_fileds' => '', 'course_settings' => '' } }, policies: { policies: { 'manage_policies' => admin_policies_path, 'add_a_new_policy' => new_admin_policy_path } }, roles: { roles: { 'manage_roles' => admin_roles_path, 'add_a_new_role' => new_admin_role_path } } }
  end
end
