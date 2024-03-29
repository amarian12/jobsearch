# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140625062120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applicants", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "patronymic"
    t.string   "status"
    t.integer  "salary"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.integer  "contactable_id"
    t.string   "contactable_type"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contacts", ["contactable_id", "contactable_type"], name: "index_contacts_on_contactable_id_and_contactable_type", using: :btree

  create_table "skill_assignments", force: true do |t|
    t.integer  "skillable_id"
    t.string   "skillable_type"
    t.integer  "skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skill_assignments", ["skill_id"], name: "index_skill_assignments_on_skill_id", using: :btree
  add_index "skill_assignments", ["skillable_id", "skillable_type"], name: "index_skill_assignments_on_skillable_id_and_skillable_type", using: :btree

  create_table "skills", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "vacancies", force: true do |t|
    t.string   "name"
    t.integer  "validity"
    t.integer  "salary"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expire_date"
  end

end
