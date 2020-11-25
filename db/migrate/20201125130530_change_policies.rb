class ChangePolicies < ActiveRecord::Migration[6.0]
  def change
    remove_index :policies, :course_id
    remove_index :policies, :group_id
    remove_index :policies, :role_id
    remove_index :policies, :user_id
    remove_column :policies, :user_id
    remove_column :policies, :group_id
    remove_column :policies, :role_id
    remove_column :policies, :course_id
  end
end
