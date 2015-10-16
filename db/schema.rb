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

ActiveRecord::Schema.define(version: 20151016133727) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags_videos", id: false, force: :cascade do |t|
    t.integer "tag_id",   null: false
    t.integer "video_id", null: false
  end

  add_index "tags_videos", ["tag_id", "video_id"], name: "index_tags_videos_on_tag_id_and_video_id", using: :btree
  add_index "tags_videos", ["video_id", "tag_id"], name: "index_tags_videos_on_video_id_and_tag_id", using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "link"
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "uid"
  end

  add_index "videos", ["uid"], name: "index_videos_on_uid", using: :btree

end
