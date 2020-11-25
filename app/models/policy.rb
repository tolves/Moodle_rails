class Policy < ApplicationRecord
  belongs_to :subject, polymorphic: true
  belongs_to :object, polymorphic: true
  has_one :policy_item, dependent: :destroy
end
