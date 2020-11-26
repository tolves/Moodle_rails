class CreateTypePolicies < ActiveRecord::Migration[6.0]
  def change
    create_table :type_policies do |t|
      t.belongs_to :policy
      t.references :subject, polymorphic: true
      t.timestamps
    end
  end
end
