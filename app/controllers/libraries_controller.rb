# app/controllers/libraries_controller.rb
class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
    @recreation_complexes = RecreationComplex.all
  end
end
