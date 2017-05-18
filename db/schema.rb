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

ActiveRecord::Schema.define(version: 20170518160703) do

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.string   "bootsy_resource_type"
    t.integer  "bootsy_resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_identities_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string   "headline"
    t.string   "sub_headline"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.text     "content"
    t.integer  "bootsy_image_gallery_id"
    t.string   "name"
    t.string   "name_url_slug"
    t.decimal  "price"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "order_offers", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "quantity"
  end

  create_table "order_sessions", force: :cascade do |t|
    t.integer  "session_id"
    t.integer  "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "session_id"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "contact_email"
    t.string   "mailing_address"
    t.boolean  "completed"
  end

  create_table "partnership_applications", force: :cascade do |t|
    t.string   "company_name"
    t.text     "company_description"
    t.string   "contact_email"
    t.string   "contact_name"
    t.string   "company_url"
    t.string   "product_name"
    t.string   "product_description"
    t.decimal  "product_retail_value"
    t.text     "product_why_is_great"
    t.boolean  "customer_service_staff"
    t.string   "contact_title"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "purchases", force: :cascade do |t|
    t.string   "email"
    t.string   "stripe_card_id"
    t.decimal  "amount"
    t.string   "description"
    t.string   "currency"
    t.string   "stripe_customer_id"
    t.integer  "order_id"
    t.string   "ip_address"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
  end

  create_table "users", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
