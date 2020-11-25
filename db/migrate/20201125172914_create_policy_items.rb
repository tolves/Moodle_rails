class CreatePolicyItems < ActiveRecord::Migration[6.0]
  def change
    create_table :policy_items do |t|
      t.string :name
      t.boolean :view
      t.boolean :edit
      t.boolean :new
      t.boolean :destroy
      t.belongs_to :policy
      t.timestamps
    end
    remove_column :policies, :new
    remove_column :policies, :edit
    remove_column :policies, :view
    remove_column :policies, :destroy
  end
end
