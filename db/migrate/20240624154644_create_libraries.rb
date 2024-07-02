class CreateLibraries < ActiveRecord::Migration[7.1]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :address
      t.text :notes
      t.string :website
      t.references :recreation_complex, foreign_key: true

      t.timestamps
    end

    add_index :libraries, :recreation_complex_id
  end
end
