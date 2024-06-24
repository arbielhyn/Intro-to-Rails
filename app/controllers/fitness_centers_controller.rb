class FitnessCentersController < ApplicationController
  def index
    @fitness_centers = FitnessCenter.all
  end
end
