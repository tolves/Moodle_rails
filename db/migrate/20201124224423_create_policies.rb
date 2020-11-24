class CreatePolicies < ActiveRecord::Migration[6.0]
  def change
    create_table :policies do |t|
      t.string :name
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true
      t.belongs_to :role, index: true
      t.belongs_to :course, index: true
      t.boolean :view
      t.boolean :destroy
      t.boolean :new
      t.boolean :edit
      t.timestamps
    end
  end
end
