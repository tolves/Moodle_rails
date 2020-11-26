class ChangeTypePoliciesPolicyIdDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_null :type_policies, :policy_id, true
  end
end
