class CreateLibraries < ActiveRecord::Migration[7.1]
  def change
    create_table :libraries do |t|
      t.string :name
      t.string :address
      t.text :notes
      t.string :website

      t.timestamps
    end
  end
end
