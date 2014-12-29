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

ActiveRecord::Schema.define(version: 20141229093455) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "desc"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "categories", ["slug"], name: "index_categories_on_slug"

  create_table "cities", force: true do |t|
    t.string   "provice"
    t.string   "name"
    t.text     "desc"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.text     "traffic"
    t.text     "note"
    t.text     "history"
    t.text     "special_product"
  end

  add_index "cities", ["slug"], name: "index_cities_on_slug", unique: true

  create_table "ckeditor_assets", force: true do |t|
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type"

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "hotels", force: true do |t|
    t.string   "name"
    t.string   "addr"
    t.string   "tel"
    t.text     "desc"
    t.text     "traffic"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rate"
  end

  add_index "hotels", ["city_id"], name: "index_hotels_on_city_id"

  create_table "images", force: true do |t|
    t.string   "desc"
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "photo_type"
  end

  add_index "images", ["imageable_id", "imageable_type"], name: "index_images_on_imageable_id_and_imageable_type"
  add_index "images", ["photo_type"], name: "index_images_on_photo_type"

  create_table "pomotions", force: true do |t|
    t.string   "title"
    t.string   "sub_title"
    t.text     "content"
    t.integer  "rate"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pomotions", ["category_id"], name: "index_pomotions_on_category_id"

  create_table "rooms", force: true do |t|
    t.integer  "hotel_id"
    t.string   "name"
    t.float    "price"
    t.string   "area"
    t.string   "floor"
    t.string   "bed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shops", force: true do |t|
    t.string   "name"
    t.string   "addr"
    t.string   "tel"
    t.text     "special"
    t.string   "work_range"
    t.float    "price_avg"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "city_id"
  end

  add_index "shops", ["city_id"], name: "index_shops_on_city_id"

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "tickets", force: true do |t|
    t.string   "style"
    t.string   "title"
    t.text     "desc"
    t.float    "price"
    t.integer  "position"
    t.integer  "tour_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tickets", ["tour_id"], name: "index_tickets_on_tour_id"

  create_table "tour_orders", force: true do |t|
    t.float    "total_price"
    t.string   "state"
    t.integer  "number"
    t.integer  "user_id"
    t.integer  "ticket_id"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "outdate"
    t.string   "user_phone"
    t.string   "user_name"
  end

  add_index "tour_orders", ["ticket_id"], name: "index_tour_orders_on_ticket_id"
  add_index "tour_orders", ["user_id"], name: "index_tour_orders_on_user_id"

  create_table "tours", force: true do |t|
    t.string   "title"
    t.string   "sub_title"
    t.string   "addr"
    t.float    "price"
    t.string   "work_range"
    t.text     "hint"
    t.text     "desc"
    t.text     "traffic"
    t.string   "seq"
    t.integer  "position"
    t.float    "lon"
    t.float    "lat"
    t.integer  "city_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tours", ["city_id"], name: "index_tours_on_city_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "phone",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "authentication_token"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
  add_index "users", ["email"], name: "index_users_on_email"
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
