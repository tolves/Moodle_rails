class Policy < ApplicationRecord
  belongs_to :subject, polymorphic: true
  belongs_to :object, polymorphic: true
end
