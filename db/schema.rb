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

ActiveRecord::Schema.define(version: 20170814161003) do

  create_table "agendas", force: :cascade do |t|
    t.datetime "start_day"
    t.datetime "end_day"
    t.float "total_payment"
    t.string "care_needs"
    t.integer "pet_id"
    t.integer "user_id"
    t.index ["pet_id"], name: "index_agendas_on_pet_id"
    t.index ["user_id"], name: "index_agendas_on_user_id"
  end

  create_table "pet_kinds", force: :cascade do |t|
    t.string "name"
  end

  create_table "pets", force: :cascade do |t|
    t.string "name"
    t.string "breed"
    t.datetime "date_of_birth"
    t.integer "size"
    t.integer "user_id"
    t.integer "pet_kind_id"
    t.index ["pet_kind_id"], name: "index_pets_on_pet_kind_id"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "phone"
    t.string "address"
    t.datetime "date_of_birth"
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
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
