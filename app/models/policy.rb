class Policy < ApplicationRecord
  belongs_to :user
  belongs_to :role
  belongs_to :course
  belongs_to :group
end
