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

ActiveRecord::Schema.define(version: 20171204161035) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advertisers", force: :cascade do |t|
    t.string "company_name"
    t.string "contact_name"
    t.string "email"
    t.string "phone"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.bigint "advertiser_id"
    t.string "name"
    t.string "utm_campaing"
    t.string "code_campaing"
    t.text "tag"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["advertiser_id"], name: "index_campaigns_on_advertiser_id"
  end

  create_table "sites", force: :cascade do |t|
    t.bigint "user_id"
    t.string "name"
    t.string "url"
    t.string "category"
    t.string "type_site"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "company_name"
    t.string "email"
    t.string "contact_name"
    t.string "phone"
    t.string "cnpj"
    t.integer "user_type"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "campaigns", "advertisers"
  add_foreign_key "sites", "users"
end
