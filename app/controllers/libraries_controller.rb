# app/controllers/libraries_controller.rb
class LibrariesController < ApplicationController
  def index
    @libraries = Library.all
  end
end
