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

ActiveRecord::Schema.define(version: 2020_07_09_054139) do

  create_table "films", force: :cascade do |t|
    t.string "title"
    t.string "film_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "type_id"
    t.string "film_id"
    t.string "age"
    t.string "gender"
    t.string "eye_color"
    t.string "hair_color"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.string "type_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "people"
  end

end
