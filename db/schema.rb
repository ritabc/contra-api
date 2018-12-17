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

ActiveRecord::Schema.define(version: 2018_12_17_183736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dance_moves", force: :cascade do |t|
    t.bigint "dance_id"
    t.bigint "move_id"
    t.integer "number_in_dance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ending_position_id"
    t.index ["dance_id"], name: "index_dance_moves_on_dance_id"
    t.index ["move_id"], name: "index_dance_moves_on_move_id"
  end

  create_table "dances", force: :cascade do |t|
    t.string "name"
    t.string "writer"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_becket"
    t.string "out_couples_waiting_position"
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "possible_move_start_positions", force: :cascade do |t|
    t.bigint "position_id"
    t.bigint "move_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["move_id"], name: "index_possible_move_start_positions_on_move_id"
    t.index ["position_id"], name: "index_possible_move_start_positions_on_position_id"
  end

  add_foreign_key "dance_moves", "positions", column: "ending_position_id"
end
