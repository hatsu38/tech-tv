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

ActiveRecord::Schema.define(version: 2020_07_08_090744) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "event_movies", force: :cascade do |t|
    t.bigint "event_id", null: false, comment: "イベントID"
    t.bigint "movie_id", null: false, comment: "動画ID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id", "movie_id"], name: "index_event_movies_on_event_id_and_movie_id", unique: true
    t.index ["event_id"], name: "index_event_movies_on_event_id"
    t.index ["movie_id"], name: "index_event_movies_on_movie_id"
  end

  create_table "event_tags", comment: "イベントとタグの紐付け", force: :cascade do |t|
    t.bigint "event_id", null: false, comment: "イベントID"
    t.bigint "tag_id", null: false, comment: "タグID"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_event_tags_on_event_id"
    t.index ["tag_id"], name: "index_event_tags_on_tag_id"
  end

  create_table "events", comment: "イベント", force: :cascade do |t|
    t.string "title", null: false, comment: "タイトル"
    t.text "catch", default: "", null: false, comment: "キャッチ"
    t.text "description", default: "", null: false, comment: "概要"
    t.string "connpass_event_url", default: "", null: false, comment: "connpass.com 上のURL"
    t.string "hash_tag", default: "", null: false, comment: "Twitterのハッシュタグ"
    t.datetime "started_at", null: false, comment: "イベント開催日時 (ISO-8601形式)"
    t.datetime "ended_at", null: false, comment: "イベント終了日時 (ISO-8601形式)"
    t.integer "limit", default: 0, null: false, comment: "定員"
    t.string "event_type", default: "", null: false, comment: "イベント参加Type"
    t.string "address", default: "", null: false, comment: "開催場所"
    t.string "place", default: "", null: false, comment: "開催会場"
    t.float "lat", comment: "開催会場の緯度"
    t.float "lon", comment: "開催会場の経度"
    t.integer "accepted", default: 0, null: false, comment: "参加者数"
    t.integer "waiting", default: 0, null: false, comment: "補欠者数"
    t.integer "applicant", default: 0, null: false, comment: "応募者数"
    t.integer "connpass_event_id", null: false, comment: "connpass.com 上のイベントID"
    t.datetime "connpass_updated_at", null: false, comment: "connpass.com 上のイベント更新日時 (ISO-8601形式)"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["connpass_event_id"], name: "index_events_on_connpass_event_id", unique: true
  end

  create_table "movies", comment: "動画", force: :cascade do |t|
    t.string "url", default: "", null: false, comment: "動画のURL"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["url"], name: "index_movies_on_url", unique: true
  end

  create_table "tags", comment: "タグ", force: :cascade do |t|
    t.string "name", null: false, comment: "名前"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "event_movies", "events"
  add_foreign_key "event_movies", "movies"
  add_foreign_key "event_tags", "events"
  add_foreign_key "event_tags", "tags"
end
