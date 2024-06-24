class CreateLibraries < ActiveRecord::Migration[7.1]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :address
      t.string :location
      t.text :notes
      t.string :website
      t.references :recreation_complex, null: false, foreign_key: true

      t.timestamps
    end
  end
end
