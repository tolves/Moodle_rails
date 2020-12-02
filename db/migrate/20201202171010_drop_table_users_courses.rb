class DropTableUsersCourses < ActiveRecord::Migration[6.0]
  def change
    drop_table :courses_users
    drop_table :groups_courses
  end
end
