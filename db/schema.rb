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

ActiveRecord::Schema.define(version: 20170724225506) do

  create_table "form_core_fields", force: :cascade do |t|
    t.string "name", null: false
    t.integer "accessibility", null: false
    t.text "validations"
    t.text "static_default_value"
    t.text "options"
    t.string "type", null: false
    t.integer "form_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "label", default: ""
    t.string "hint", default: ""
    t.string "prompt", default: ""
    t.index ["form_id"], name: "index_form_core_fields_on_form_id"
    t.index ["type"], name: "index_form_core_fields_on_type"
  end

  create_table "form_core_forms", force: :cascade do |t|
    t.string "type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title", default: ""
    t.text "description", default: ""
    t.index ["type"], name: "index_form_core_forms_on_type"
  end

end
