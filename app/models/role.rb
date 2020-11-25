class Role < ApplicationRecord
  has_many :users
  has_many :policies, as: :subject
end
