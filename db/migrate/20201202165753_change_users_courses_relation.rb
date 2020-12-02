class ChangeUsersCoursesRelation < ActiveRecord::Migration[6.0]
  def change
    drop_table :users_courses
    create_join_table :users, :courses do |t|
      t.index :user_id
      t.index :course_id
    end
  end
end
