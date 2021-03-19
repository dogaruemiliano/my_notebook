class Postit < ApplicationRecord
  # Add database relations
  belongs_to :user

  # Validations
  validates :user, presence: true
end
