class AdminController < ApplicationController
  def index
    @menu = %w[a b c d]
    @nav_items = %w[site_administration users courses grades plugins apperance server reports development]
    @tabs = admin_dashboard
  end

  def show; end

  def new; end

  def create; end

  def edit; end

  def update; end

  def destroy; end

  private

  def admin_dashboard
    {
      users: {
        accounts: {
          'browse_list_users' => admin_users_path,
          'add_a_new_user' => new_admin_user_path,
          'user_default_preferences' => '',
          'User_customise_fields' => '',
          'group' => ''
        },
        permissions: {
          'manage_roles' => '',
          'define_roles' => ''
        }
      },
      site_administration: {
        '': {
          'notifications' => '',
          'registration' => '',
          'moodle_services' => '',
          'feedback_settings' => '',
          'advanced_features' => '',
        },
        analytics: {
          'site_information' => '',
          'analytics_settings' => '',
          'analytics_models' => '',
        },
        language: {
          'language_settings' => '',
          'language_customisation' => '',
          'language_packs' => '',
        },
        location: {
          'location_settings' => '',
        },
        badges: {
          'manage_badges' => '',
          'add_new_badges' => '',
          'badges_settings' => '',
        }
      },
      courses: {
        courses: {
          'manage_courses' => '',
          'manage_courses_categories' => '',
          'course_custom_fileds' => '',
          'course_settings' => '',
        }
      }
    }
  end
end
