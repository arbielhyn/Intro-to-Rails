class RecreationComplexesController < ApplicationController
  def index
    @recreation_complexes = if params[:search]
                              RecreationComplex.where("name LIKE ?", "%#{params[:search]}%").page(params[:page])
                            else
                              RecreationComplex.page(params[:page])
                            end
  end

  def show
    @recreation_complex = RecreationComplex.find(params[:id])
    @libraries = Library.where("name LIKE ?", "%#{@recreation_complex.name}%")
  end
end
