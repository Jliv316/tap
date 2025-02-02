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

ActiveRecord::Schema.define(version: 2021_02_25_002722) do

  create_table "campaign_qualifications", force: :cascade do |t|
    t.text "pre_codes"
    t.integer "question_id"
    t.integer "campaign_quota_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_quota_id"], name: "index_campaign_qualifications_on_campaign_quota_id"
  end

  create_table "campaign_quotas", force: :cascade do |t|
    t.integer "tap_id"
    t.integer "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_campaign_quotas_on_campaign_id"
  end

  create_table "campaigns", force: :cascade do |t|
    t.integer "tap_id"
    t.string "name"
    t.integer "length_of_interview"
    t.string "cpi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
