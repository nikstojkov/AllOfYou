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

ActiveRecord::Schema[7.0].define(version: 2023_03_08_122055) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "application_artworks", force: :cascade do |t|
    t.bigint "artwork_id", null: false
    t.bigint "application_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["application_id"], name: "index_application_artworks_on_application_id"
    t.index ["artwork_id"], name: "index_application_artworks_on_artwork_id"
  end

  create_table "applications", force: :cascade do |t|
    t.bigint "opportunity_id", null: false
    t.bigint "artist_id", null: false
    t.text "content"
    t.boolean "success"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_applications_on_artist_id"
    t.index ["opportunity_id"], name: "index_applications_on_opportunity_id"
  end

  create_table "artist_tags", force: :cascade do |t|
    t.bigint "artist_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artist_tags_on_artist_id"
    t.index ["tag_id"], name: "index_artist_tags_on_tag_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.string "location"
    t.string "pronouns"
    t.index ["email"], name: "index_artists_on_email", unique: true
    t.index ["reset_password_token"], name: "index_artists_on_reset_password_token", unique: true
  end

  create_table "artwork_tags", force: :cascade do |t|
    t.bigint "artwork_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artwork_id"], name: "index_artwork_tags_on_artwork_id"
    t.index ["tag_id"], name: "index_artwork_tags_on_tag_id"
  end

  create_table "artworks", force: :cascade do |t|
    t.bigint "artist_id", null: false
    t.string "name"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_artworks_on_artist_id"
  end

  create_table "opportunities", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.string "location"
    t.text "description"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_opportunities_on_user_id"
  end

  create_table "opportunity_tags", force: :cascade do |t|
    t.bigint "opportunity_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["opportunity_id"], name: "index_opportunity_tags_on_opportunity_id"
    t.index ["tag_id"], name: "index_opportunity_tags_on_tag_id"
  end

  create_table "shortlisted_artists", force: :cascade do |t|
    t.bigint "shortlist_id", null: false
    t.bigint "artist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_shortlisted_artists_on_artist_id"
    t.index ["shortlist_id"], name: "index_shortlisted_artists_on_shortlist_id"
  end

  create_table "shortlists", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shortlists_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "location"
    t.text "bio"
    t.string "pronouns"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "application_artworks", "applications"
  add_foreign_key "application_artworks", "artworks"
  add_foreign_key "applications", "artists"
  add_foreign_key "applications", "opportunities"
  add_foreign_key "artist_tags", "artists"
  add_foreign_key "artist_tags", "tags"
  add_foreign_key "artwork_tags", "artworks"
  add_foreign_key "artwork_tags", "tags"
  add_foreign_key "artworks", "artists"
  add_foreign_key "opportunities", "users"
  add_foreign_key "opportunity_tags", "opportunities"
  add_foreign_key "opportunity_tags", "tags"
  add_foreign_key "shortlisted_artists", "artists"
  add_foreign_key "shortlisted_artists", "shortlists"
  add_foreign_key "shortlists", "users"
end
