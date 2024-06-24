# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_24_154645) do
  create_table "fitness_centers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "location"
    t.text "notes"
    t.string "website"
    t.integer "recreation_complex_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recreation_complex_id"], name: "index_fitness_centers_on_recreation_complex_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "location"
    t.text "notes"
    t.string "website"
    t.integer "recreation_complex_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recreation_complex_id"], name: "index_libraries_on_recreation_complex_id"
  end

  create_table "recreation_complexes", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "location"
    t.string "complex_id"
    t.text "notes"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fitness_centers", "recreation_complexes"
  add_foreign_key "libraries", "recreation_complexes"
end
