class Role < ApplicationRecord
  has_many :users
  has_many :role_authorities, validate: true
  # has_many :type_policies, as: :subject, validate: true
end
