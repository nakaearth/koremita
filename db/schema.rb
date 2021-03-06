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

ActiveRecord::Schema.define(version: 20140908155059) do

  create_table "api_tokens", force: true do |t|
    t.string   "acces_token"
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "api_tokens", ["user_id"], name: "index_api_tokens_on_user_id"

  create_table "auth_providers", force: true do |t|
    t.integer  "user_id"
    t.string   "provider",    null: false
    t.string   "uid",         null: false
    t.string   "screen_name"
    t.string   "image_path"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auth_providers", ["user_id"], name: "index_auth_providers_on_user_id"

  create_table "comments", force: true do |t|
    t.string   "message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "movie_id"
  end

  add_index "comments", ["movie_id"], name: "index_comments_on_movie_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "movies", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "view_flag"
    t.integer  "rate"
    t.integer  "user_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.string   "photo"
  end

  add_index "movies", ["user_id"], name: "index_movies_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "youtubs", force: true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "movie_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
