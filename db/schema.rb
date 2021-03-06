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

ActiveRecord::Schema.define(version: 2020_11_19_115034) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "club_favorites", force: :cascade do |t|
    t.bigint "club_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_id"], name: "index_club_favorites_on_club_id"
    t.index ["student_id"], name: "index_club_favorites_on_student_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.string "university"
    t.text "detail"
    t.text "home"
    t.text "sns"
    t.boolean "intercollege", default: false
    t.boolean "active"
    t.integer "premium", default: 0
    t.index ["confirmation_token"], name: "index_clubs_on_confirmation_token", unique: true
    t.index ["email"], name: "index_clubs_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clubs_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_clubs_on_unlock_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.bigint "student_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_comments_on_event_id"
    t.index ["student_id"], name: "index_comments_on_student_id"
  end

  create_table "event_favorites", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_favorites_on_event_id"
    t.index ["student_id"], name: "index_event_favorites_on_student_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.bigint "club_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.datetime "start"
    t.datetime "end"
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.index ["club_id"], name: "index_events_on_club_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "club_visitor_id"
    t.bigint "club_visited_id"
    t.bigint "student_visitor_id"
    t.bigint "student_visited_id"
    t.bigint "event_id"
    t.bigint "comment_id"
    t.string "action"
    t.boolean "checked", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_visited_id"], name: "index_notifications_on_club_visited_id"
    t.index ["club_visitor_id"], name: "index_notifications_on_club_visitor_id"
    t.index ["comment_id"], name: "index_notifications_on_comment_id"
    t.index ["event_id"], name: "index_notifications_on_event_id"
    t.index ["student_visited_id"], name: "index_notifications_on_student_visited_id"
    t.index ["student_visitor_id"], name: "index_notifications_on_student_visitor_id"
  end

  create_table "premium_mails", force: :cascade do |t|
    t.string "title"
    t.text "message"
    t.datetime "time"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "club_id", null: false
    t.index ["club_id"], name: "index_premium_mails_on_club_id"
  end

  create_table "relationships", force: :cascade do |t|
    t.bigint "student_id", null: false
    t.bigint "follow_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["follow_id"], name: "index_relationships_on_follow_id"
    t.index ["student_id", "follow_id"], name: "index_relationships_on_student_id_and_follow_id", unique: true
    t.index ["student_id"], name: "index_relationships_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "provider"
    t.string "uid"
    t.string "username"
    t.string "name"
    t.integer "gender", default: 3
    t.string "university"
    t.string "department"
    t.string "highschool"
    t.string "hobby"
    t.text "detail"
    t.integer "prefecture", default: 0
    t.index ["confirmation_token"], name: "index_students_on_confirmation_token", unique: true
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_students_on_unlock_token", unique: true
  end

  create_table "tag_relationships", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id", "tag_id"], name: "index_tag_relationships_on_event_id_and_tag_id", unique: true
    t.index ["event_id"], name: "index_tag_relationships_on_event_id"
    t.index ["tag_id"], name: "index_tag_relationships_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "widgets", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "club_favorites", "clubs"
  add_foreign_key "club_favorites", "students"
  add_foreign_key "comments", "events"
  add_foreign_key "comments", "students"
  add_foreign_key "event_favorites", "events"
  add_foreign_key "event_favorites", "students"
  add_foreign_key "events", "clubs"
  add_foreign_key "notifications", "clubs", column: "club_visited_id"
  add_foreign_key "notifications", "clubs", column: "club_visitor_id"
  add_foreign_key "notifications", "comments"
  add_foreign_key "notifications", "events"
  add_foreign_key "notifications", "students", column: "student_visited_id"
  add_foreign_key "notifications", "students", column: "student_visitor_id"
  add_foreign_key "premium_mails", "clubs"
  add_foreign_key "relationships", "students"
  add_foreign_key "relationships", "students", column: "follow_id"
  add_foreign_key "tag_relationships", "events"
  add_foreign_key "tag_relationships", "tags"
end
