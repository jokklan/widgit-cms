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

ActiveRecord::Schema.define(version: 20141104234026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

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

  create_table "widgit_widget_groups", force: true do |t|
    t.integer  "widgetable_id"
    t.string   "widgetable_type"
    t.integer  "position",        null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "widgit_widget_groups", ["widgetable_id", "widgetable_type"], name: "index_widgit_widget_groups_on_widgetable", using: :btree

  create_table "widgit_widgets", force: true do |t|
    t.integer  "widget_group_id"
    t.string   "type",            null: false
    t.integer  "columns",         null: false
    t.integer  "position",        null: false
    t.hstore   "properties"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "widgit_widgets", ["widget_group_id"], name: "index_widgit_widgets_on_widget_group_id", using: :btree

end
