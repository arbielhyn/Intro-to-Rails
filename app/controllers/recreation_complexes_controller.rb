class RecreationComplexesController < ApplicationController
  def index
    @recreation_complexes = RecreationComplex.all
  end
end
