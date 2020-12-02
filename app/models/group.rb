class Group < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :type_policies, as: :subject, validate: true
end
