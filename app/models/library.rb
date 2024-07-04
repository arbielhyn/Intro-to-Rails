class Library < ApplicationRecord
  belongs_to :recreation_complex

  # Validation for the name attribute
  validates :name, presence: true
end
