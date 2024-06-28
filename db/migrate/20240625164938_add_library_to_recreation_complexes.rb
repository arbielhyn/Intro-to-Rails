class AddLibraryToRecreationComplexes < ActiveRecord::Migration[7.1]
  def change
    add_column :recreation_complexes, :library, :boolean
  end
end
