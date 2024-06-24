class RecreationComplex < ApplicationRecord
  has_many :libraries
  has_many :fitness_centers
end
