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

ActiveRecord::Schema.define(version: 20150423100513) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "text",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "commenter",  limit: 65535
    t.text     "body",       limit: 65535
    t.integer  "article_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "comments", ["article_id"], name: "index_comments_on_article_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  create_table "specialties", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer  "avatar_id",  limit: 4
    t.string   "login",      limit: 255
    t.string   "password",   limit: 255
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "patronymic", limit: 255
    t.integer  "sex",        limit: 4,   default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "users", ["avatar_id"], name: "index_users_on_avatar_id", using: :btree

  create_table "worker", force: :cascade do |t|
    t.integer "section_id", limit: 4,   null: false
    t.string  "name",       limit: 255, null: false
    t.string  "salary",     limit: 255, null: false
  end

  add_index "worker", ["section_id"], name: "section_id", using: :btree

  create_table "worker_has_specialty", id: false, force: :cascade do |t|
    t.integer "user_id",      limit: 4, null: false
    t.integer "specialty_id", limit: 4, null: false
  end

  add_index "worker_has_specialty", ["specialty_id"], name: "specialty_id", using: :btree
  add_index "worker_has_specialty", ["user_id"], name: "user_id", using: :btree

  add_foreign_key "comments", "articles"
  add_foreign_key "worker", "sections", name: "worker_ibfk_1"
  add_foreign_key "worker_has_specialty", "specialties", name: "worker_has_specialty_ibfk_2", on_update: :cascade, on_delete: :cascade
  add_foreign_key "worker_has_specialty", "worker", column: "user_id", name: "worker_has_specialty_ibfk_1", on_update: :cascade, on_delete: :cascade
end
