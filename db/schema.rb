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

ActiveRecord::Schema.define(version: 2020_03_02_191741) do

  create_table "bets", force: :cascade do |t|
    t.integer "snail_race_id", null: false
    t.integer "user_id", null: false
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["snail_race_id"], name: "index_bets_on_snail_race_id"
    t.index ["user_id"], name: "index_bets_on_user_id"
  end

  create_table "bodies", force: :cascade do |t|
    t.string "color"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "prizes", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "races", force: :cascade do |t|
    t.integer "number"
    t.integer "prize_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["prize_id"], name: "index_races_on_prize_id"
  end

  create_table "shells", force: :cascade do |t|
    t.string "color"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "snail_races", force: :cascade do |t|
    t.integer "snail_id", null: false
    t.integer "race_id", null: false
    t.float "odds"
    t.integer "rank"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["race_id"], name: "index_snail_races_on_race_id"
    t.index ["snail_id"], name: "index_snail_races_on_snail_id"
  end

  create_table "snails", force: :cascade do |t|
    t.string "name"
    t.integer "shell_id", null: false
    t.integer "body_id", null: false
    t.float "speed"
    t.string "favorite_food"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "exists", default: true
    t.index ["body_id"], name: "index_snails_on_body_id"
    t.index ["shell_id"], name: "index_snails_on_shell_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.integer "money"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "bets", "snail_races"
  add_foreign_key "bets", "users"
  add_foreign_key "races", "prizes"
  add_foreign_key "snail_races", "races"
  add_foreign_key "snail_races", "snails"
  add_foreign_key "snails", "bodies"
  add_foreign_key "snails", "shells"
end
