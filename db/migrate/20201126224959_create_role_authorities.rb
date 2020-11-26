class CreateRoleAuthorities < ActiveRecord::Migration[6.0]
  def change
    create_table :role_authorities do |t|
      t.belongs_to :role
      t.string :controller_name
      t.string :action_names, array: true
      t.timestamps
    end
    add_index :role_authorities, :action_names, using: 'gin'
  end
end
