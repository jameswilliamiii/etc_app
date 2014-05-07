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

ActiveRecord::Schema.define(version: 20140507220806) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "class_offers", force: true do |t|
    t.text     "summary"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "non_member_cost"
    t.string   "standard_member_cost"
    t.string   "premier_member_cost"
    t.string   "teacher"
    t.string   "status"
    t.text     "teacher_profile"
    t.text     "requirements"
    t.text     "whats_included"
    t.text     "learning_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "class_offers", ["id", "start_date"], name: "index_class_offers_on_id_and_start_date", using: :btree

  create_table "faqs", force: true do |t|
    t.text     "question"
    t.text     "answer"
    t.integer  "class_offer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "faqs", ["id", "class_offer_id"], name: "index_faqs_on_id_and_class_offer_id", using: :btree

  create_table "profiles", force: true do |t|
    t.string   "name"
    t.string   "company"
    t.boolean  "public"
    t.text     "details"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "linkedin"
    t.string   "github"
    t.string   "website"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "profile_type"
    t.integer  "user_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "profiles", ["profile_type"], name: "index_profiles_on_profile_type", using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "membership_type"
    t.date     "member_since"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.boolean  "admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true, using: :btree
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count", using: :btree
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id", using: :btree
  add_index "users", ["membership_type"], name: "index_users_on_membership_type", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
