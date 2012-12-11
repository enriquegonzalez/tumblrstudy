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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121211211331) do

  create_table "authorizations", :force => true do |t|
    t.string   "token"
    t.string   "secret"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tumblrs", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "followers"
    t.integer  "total_posts"
    t.integer  "total_notes"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "tumblr_token"
    t.string   "tumblr_secret"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "uid"
  end

end
