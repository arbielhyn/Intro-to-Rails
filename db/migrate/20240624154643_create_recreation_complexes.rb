class CreateRecreationComplexes < ActiveRecord::Migration[7.1]
  def change
    create_table :recreation_complexes do |t|
      t.integer :recreation_complex_id
      t.string :name

      t.timestamps
    end

    add_index :recreation_complexes, :recreation_complex_id, unique: true
  end
end
