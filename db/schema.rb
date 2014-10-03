# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140930132400) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "boards", ["name"], name: "index_boards_on_name", using: :btree

  create_table "characters", force: true do |t|
    t.string   "name"
    t.integer  "top_left_x"
    t.integer  "top_left_y"
    t.integer  "width"
    t.integer  "height"
    t.integer  "board_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "characters", ["name"], name: "index_characters_on_name", using: :btree

  create_table "players", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["name"], name: "index_players_on_name", using: :btree

  create_table "scores", force: true do |t|
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "board_id"
    t.integer  "player_id"
  end

end
