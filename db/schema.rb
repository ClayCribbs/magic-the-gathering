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

ActiveRecord::Schema.define(version: 20170429170933) do

  create_table "card_matches", force: :cascade do |t|
    t.integer  "match_ids"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "card_id"
    t.integer  "match_id"
  end

  create_table "card_mtg_sets", force: :cascade do |t|
    t.integer  "card_id"
    t.integer  "mtg_set_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cards", force: :cascade do |t|
    t.string   "multiverse_id"
    t.string   "layout"
    t.string   "names"
    t.string   "mana_cost"
    t.string   "cmc"
    t.string   "colors"
    t.string   "special_type"
    t.string   "supertypes"
    t.string   "subtypes"
    t.string   "rarity"
    t.string   "text"
    t.string   "flavor"
    t.string   "artist"
    t.string   "number"
    t.string   "power"
    t.string   "toughness"
    t.string   "loyalty"
    t.string   "variations"
    t.string   "watermark"
    t.string   "border"
    t.string   "timeshifted"
    t.string   "hand"
    t.string   "life"
    t.string   "reserved"
    t.string   "release_date"
    t.string   "starter"
    t.string   "rulings"
    t.string   "foreign_names"
    t.string   "printings"
    t.string   "original_text"
    t.string   "original_type"
    t.string   "legalities"
    t.string   "source"
    t.string   "image_url"
    t.string   "set"
    t.string   "set_name"
    t.string   "alternate_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "matches", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mtg_sets", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "gatherer_code"
    t.string   "old_code"
    t.string   "magic_cards_info_code"
    t.string   "release_date"
    t.string   "border"
    t.string   "set_type"
    t.string   "block"
    t.string   "online_only"
    t.string   "booster"
    t.string   "mkm_id"
    t.string   "mkm_name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

end
