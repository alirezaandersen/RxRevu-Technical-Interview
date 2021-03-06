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

ActiveRecord::Schema.define(version: 20180925161201) do

  create_table "diseases", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "drugs", force: :cascade do |t|
    t.string "name"
    t.boolean "opioid", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "hospital_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medications", force: :cascade do |t|
    t.integer "strength"
    t.string "strength_unit"
    t.string "form"
    t.integer "drug_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescribers", force: :cascade do |t|
    t.string "prescriber_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prescriptions", id: false, force: :cascade do |t|
    t.integer "id", limit: 11
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "frequency_per_day"
    t.integer "days_supply"
    t.integer "medication_id"
    t.integer "prescriber_id"
    t.integer "hospital_id"
    t.integer "disease_id"
    t.index ["disease_id"], name: "index_prescriptions_on_disease_id"
    t.index ["hospital_id"], name: "index_prescriptions_on_hospital_id"
    t.index ["medication_id"], name: "index_prescriptions_on_medication_id"
    t.index ["prescriber_id"], name: "index_prescriptions_on_prescriber_id"
  end

end
