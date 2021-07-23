# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_22_115848) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.string "weapon_type"
    t.string "description"
    t.integer "range"
    t.string "quality"
    t.integer "dice_type"
    t.integer "dice_qty"
    t.integer "proficiency"
    t.integer "ammo"
    t.string "damage_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
