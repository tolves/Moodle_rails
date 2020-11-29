class RoleAuthority < ApplicationRecord
  belongs_to :role
  validates_presence_of :role_id, message: "can't be nil"
  validates_presence_of :action_names, message: "can't be nil"
  validates :role_id, uniqueness: {scope: %i[controller_name], message: 'should only one'}
end
