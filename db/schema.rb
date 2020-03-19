# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_19_160206) do

  create_table "achievements", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "commands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string "name", null: false
    t.integer "home_command_id", null: false
    t.integer "guest_command_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_command_id"], name: "index_matches_on_guest_command_id"
    t.index ["home_command_id"], name: "index_matches_on_home_command_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.integer "command_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["command_id"], name: "index_players_on_command_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "achievement_id", null: false
    t.integer "match_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["achievement_id"], name: "index_ratings_on_achievement_id"
    t.index ["match_id"], name: "index_ratings_on_match_id"
    t.index ["player_id"], name: "index_ratings_on_player_id"
  end

end
