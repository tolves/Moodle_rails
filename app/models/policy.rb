class Policy < ApplicationRecord
  belongs_to :object, polymorphic: true
  has_one :policy_item, dependent: :destroy
  has_many :type_policies
end
