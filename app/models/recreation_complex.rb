class RecreationComplex < ApplicationRecord
  has_many :libraries
  has_many :fitness_centers

  def has_library?
    self.library
  end

    def show
      @recreation_complex = RecreationComplex.find(params[:id])
      @libraries = @recreation_complex.libraries if @recreation_complex.has_library?
      end

    # Include Kaminari pagination methods
    include Kaminari::ActiveRecordRelationMethods

    # Optional: If you want to customize the default per page limit
    paginates_per 10

end
