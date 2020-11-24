class UserHasAndBelongsToManyGroup < ActiveRecord::Migration[6.0]
  def change
    remove_reference :users, :groups, foreign_key: true, index: true
    create_table :users_groups, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true
    end
  end
end
