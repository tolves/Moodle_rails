class RenamePolicyItemsDestroy < ActiveRecord::Migration[6.0]
  def change
    rename_column :policy_items, :destroy, :delete
  end
end
