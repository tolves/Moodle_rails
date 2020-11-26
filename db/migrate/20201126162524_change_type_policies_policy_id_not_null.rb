class ChangeTypePoliciesPolicyIdNotNull < ActiveRecord::Migration[6.0]
  def change
    change_column_null :type_policies, :policy_id, false
    change_column_default :type_policies, :policy_id, false
  end
end
