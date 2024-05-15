# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_15_075110) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "collections", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.text "description"
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_collections_on_user_id"
  end

  create_table "custom_details", primary_key: "collection_id", force: :cascade do |t|
    t.boolean "int1_flag", default: false
    t.string "int1_name"
    t.boolean "int2_flag", default: false
    t.string "int2_name"
    t.boolean "int3_flag", default: false
    t.string "int3_name"
    t.boolean "string1_flag", default: false
    t.string "string1_name"
    t.boolean "string2_flag", default: false
    t.string "string2_name"
    t.boolean "string3_flag", default: false
    t.string "string3_name"
    t.boolean "txt1_flag", default: false
    t.string "txt1_name"
    t.boolean "txt2_flag", default: false
    t.string "txt2_name"
    t.boolean "txt3_flag", default: false
    t.string "txt3_name"
    t.boolean "date1_flag", default: false
    t.string "date1_name"
    t.boolean "date2_flag", default: false
    t.string "date2_name"
    t.boolean "date3_flag", default: false
    t.string "date3_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_custom_details_on_collection_id"
  end

  create_table "hearts", primary_key: ["user_id", "item_id"], force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_hearts_on_item_id"
    t.index ["user_id"], name: "index_hearts_on_user_id"
  end

  create_table "item_to_tags", primary_key: ["item_id", "tag_id"], force: :cascade do |t|
    t.bigint "item_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_to_tags_on_item_id"
    t.index ["tag_id"], name: "index_item_to_tags_on_tag_id"
  end

  create_table "items", force: :cascade do |t|
    t.bigint "collection_id", null: false
    t.string "name", null: false
    t.integer "int1"
    t.integer "int2"
    t.integer "int3"
    t.string "str1"
    t.string "str2"
    t.string "str3"
    t.text "txt1"
    t.text "txt2"
    t.text "txt3"
    t.date "date1"
    t.date "date2"
    t.date "date3"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_items_on_collection_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "name"
    t.string "email", null: false
    t.string "password_digest", null: false
    t.boolean "status", default: true, null: false
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "collections", "users"
  add_foreign_key "custom_details", "collections"
  add_foreign_key "hearts", "items"
  add_foreign_key "hearts", "users"
  add_foreign_key "item_to_tags", "items"
  add_foreign_key "item_to_tags", "tags"
  add_foreign_key "items", "collections"
end
