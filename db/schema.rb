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

ActiveRecord::Schema.define(version: 20150717123317) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accepted_challenges", force: :cascade do |t|
    t.integer  "challenge_id"
    t.boolean  "is_accomplished", default: false
    t.text     "remark"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "challenges", force: :cascade do |t|
    t.integer  "creator_id"
    t.integer  "challenger_id"
    t.string   "name",                                                                                                                              null: false
    t.boolean  "is_public",         default: false
    t.boolean  "is_proof_required", default: false
    t.string   "location"
    t.string   "time_limit"
    t.string   "img_url",           default: "http://img06.deviantart.net/3395/i/2014/022/6/6/stardust_texture_ii__by_galaxiesanddust-d739shx.jpg"
    t.text     "proof_description"
    t.text     "description",                                                                                                                       null: false
    t.string   "sample_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "challenger_email"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "body"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "proofs", force: :cascade do |t|
    t.string   "proof_url"
    t.integer  "accepted_challenge_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
  end

  create_table "tags", force: :cascade do |t|
    t.integer "challenge_id"
    t.string  "name"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                                                                                                                                                            null: false
    t.string   "username"
    t.string   "password_digest",                                                                                                                                                  null: false
    t.string   "location"
    t.string   "gender"
    t.date     "birth_date"
    t.string   "img_url",          default: "http://at-cdn-s01.audiotool.com/2014/02/26/documents/fixit_-_challenge_accepted/2/cover256x256-adb5b94f4a6a4017a4933d9c63e696b3.jpg"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

end
