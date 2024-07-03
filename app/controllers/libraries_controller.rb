# app/controllers/libraries_controller.rb
class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
  end
  def show
    @library = Library.find(params[:id])
    @recreation_complex = @library.recreation_complex
  end
end
