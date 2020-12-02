class ChangeRelationUsersGroups < ActiveRecord::Migration[6.0]
  def change
    drop_table :users_groups
    create_join_table :groups, :users do |t|
      t.index :user_id
      t.index :group_id
    end
  end
end
