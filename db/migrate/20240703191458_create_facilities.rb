class CreateFacilities < ActiveRecord::Migration[7.1]
  def change
    create_table :facilities do |t|
      t.string :name
      t.text :description
      t.references :recreation_complex, null: false, foreign_key: true

      t.timestamps
    end
  end
end
