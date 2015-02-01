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

ActiveRecord::Schema.define(version: 20150129210019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "widgit_blocks", force: true do |t|
    t.integer  "buildable_id"
    t.string   "buildable_type"
    t.integer  "position",                           null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "background_color", default: "white"
  end

  add_index "widgit_blocks", ["buildable_id", "buildable_type"], name: "index_widgit_blocks_on_buildable_id_and_buildable_type", using: :btree

  create_table "widgit_columns", force: true do |t|
    t.integer  "block_id",   null: false
    t.integer  "tile_id"
    t.integer  "columns",    null: false
    t.integer  "position",   null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "widgit_columns", ["block_id"], name: "index_widgit_columns_on_block_id", using: :btree
  add_index "widgit_columns", ["tile_id"], name: "index_widgit_columns_on_tile_id", using: :btree

  create_table "widgit_components", force: true do |t|
    t.integer  "tile_id"
    t.string   "type",       null: false
    t.integer  "position",   null: false
    t.hstore   "properties"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "widgit_components", ["tile_id"], name: "index_widgit_components_on_tile_id", using: :btree

  create_table "widgit_images", force: true do |t|
    t.string   "image",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "widgit_pages", force: true do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "widgit_tiles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "saved",      default: false, null: false
  end

end
