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

ActiveRecord::Schema.define(:version => 20120327193053) do

  create_table "movies", :force => true do |t|
    t.string   "title"
    t.string   "imdb_id"
    t.text     "url"
    t.text     "cast_members"
    t.string   "director"
    t.string   "genres"
    t.string   "languages"
    t.integer  "length",       :default => 0
    t.text     "plot"
    t.string   "poster"
    t.float    "imdb_rating",  :default => 0.0
    t.float    "my_rating",    :default => 0.0
    t.string   "tagline"
    t.string   "trailer_url"
    t.integer  "year"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "release_date"
    t.text     "poster_1"
    t.text     "poster_2"
    t.text     "poster_3"
  end

end
