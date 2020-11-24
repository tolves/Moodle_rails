class Course < ApplicationRecord
  has_many :assignments
  has_many :wikis
  has_and_belongs_to_many :users
  has_and_belongs_to_many :groups
end
