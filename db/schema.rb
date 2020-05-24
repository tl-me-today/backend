# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_24_122043) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "book_settings", force: :cascade do |t|
    t.integer "book_id"
    t.boolean "may_download"
    t.boolean "may_copied"
    t.boolean "payment_all_book"
    t.boolean "payment"
    t.string "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "name"
    t.string "original_name"
    t.integer "author_id"
    t.integer "roles_id"
    t.text "description"
    t.integer "chapters_count"
    t.date "year"
    t.integer "group_id"
    t.integer "catalog_id"
    t.float "amount"
    t.integer "book_settings_id"
    t.float "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.text "tags_ids", default: [], array: true
    t.text "genre_ids", default: [], array: true
  end

  create_table "chapters", force: :cascade do |t|
    t.integer "book_id"
    t.string "name"
    t.text "body"
    t.integer "volume_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.float "money"
    t.float "rating"
    t.integer "contacts_id"
    t.integer "settings_id"
    t.integer "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "volumes", force: :cascade do |t|
    t.integer "book_id"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
