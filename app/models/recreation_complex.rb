class RecreationComplex < ApplicationRecord
  has_many :libraries
  has_many :facilities
  belongs_to :category

  # Include Kaminari pagination methods
  include Kaminari::ActiveRecordRelationMethods

  # Optional: If you want to customize the default per page limit
  paginates_per 10

  # Validation for the name attribute
  validates :name, presence: true
end
