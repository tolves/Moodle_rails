class TypePolicy < ApplicationRecord
  belongs_to :policy
  belongs_to :subject, polymorphic: true
  validates_presence_of :policy_id, message: "policy can't be nil"
  validates :policy_id, uniqueness: {scope: %i[subject_id subject_type], message: 'should only one per course'}
end
