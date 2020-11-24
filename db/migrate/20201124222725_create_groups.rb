class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.timestamps
    end
    add_reference :users, :groups, foreign_key: true
  end
end
