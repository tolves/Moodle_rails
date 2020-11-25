class RenamePolicyItemsDelete < ActiveRecord::Migration[6.0]
  def change
    rename_column :policy_items, :delete, :remove
  end
end
