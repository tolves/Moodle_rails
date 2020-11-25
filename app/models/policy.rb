class Policy < ApplicationRecord
  belongs_to :subject, polymorphic: true
  belongs_to :object, polymorphic: true
  has_many :policy_items
end
