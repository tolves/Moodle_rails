class TypePolicy < ApplicationRecord
  belongs_to :policy
  belongs_to :subject, polymorphic: true
end
