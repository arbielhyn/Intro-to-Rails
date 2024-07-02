class AddRecreationComplexIdToRecreationComplexes < ActiveRecord::Migration[7.1]
  def change
    add_column :recreation_complexes, :recreation_complex_id, :integer
  end
end
