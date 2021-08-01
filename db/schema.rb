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

ActiveRecord::Schema.define(version: 2021_08_01_101942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "character_classifications", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "classification_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_character_classifications_on_character_id"
    t.index ["classification_id"], name: "index_character_classifications_on_classification_id"
  end

  create_table "character_weapons", force: :cascade do |t|
    t.bigint "character_id", null: false
    t.bigint "weapon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["character_id"], name: "index_character_weapons_on_character_id"
    t.index ["weapon_id"], name: "index_character_weapons_on_weapon_id"
  end

  create_table "characters", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "description"
    t.integer "strength", default: 20
    t.integer "constitution", default: 20
    t.integer "discipline", default: 20
    t.integer "intelligence", default: 20
    t.integer "sense", default: 20
    t.integer "will", default: 20
    t.integer "charm", default: 20
    t.integer "speed", default: 1
    t.integer "flying_speed", default: 0
    t.integer "health"
    t.integer "dodge"
    t.integer "might"
    t.integer "strike"
    t.integer "athletics", default: 0
    t.integer "intimidation_STR", default: 0
    t.integer "force", default: 0
    t.integer "acrobatics", default: 0
    t.integer "precision", default: 0
    t.integer "stealth", default: 0
    t.integer "endurance", default: 0
    t.integer "resistance", default: 0
    t.integer "tech", default: 0
    t.integer "science", default: 0
    t.integer "investigation", default: 0
    t.integer "perception", default: 0
    t.integer "insight", default: 0
    t.integer "persuasion", default: 0
    t.integer "deception", default: 0
    t.integer "intimidation_CHA", default: 0
    t.integer "melee", default: 0
    t.integer "short_range", default: 0
    t.integer "medium_range", default: 0
    t.integer "long_range", default: 0
    t.integer "mutation_points", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_characters_on_user_id"
  end

  create_table "classifications", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "strike_stat"
    t.string "might_stat"
    t.string "dodge_stat"
    t.string "gene_pool"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

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

  add_foreign_key "character_classifications", "characters"
  add_foreign_key "character_classifications", "classifications"
  add_foreign_key "character_weapons", "characters"
  add_foreign_key "character_weapons", "weapons"
  add_foreign_key "characters", "users"
end
