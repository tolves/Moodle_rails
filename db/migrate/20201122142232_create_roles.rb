class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name
      t.json :permissions
      t.timestamps
    end
    remove_column :users, :role
    add_reference :users, :role, foreign_key: true
  end

end
