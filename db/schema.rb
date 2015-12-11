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

ActiveRecord::Schema.define(version: 20151115233204) do

  create_table "assets", primary_key: "Id", force: true do |t|
    t.string "Description", limit: 100
    t.boolean "Active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "entitytypes", primary_key: "Id", force: true do |t|
    t.string "Description", limit: 100, null: false
    t.boolean "Active", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberministrypositions", primary_key: "Id", force: true do |t|
    t.integer "member_id"
    t.integer "ministry_id"
    t.integer "position_id"
  end

  add_index "memberministrypositions", ["member_id", "ministry_id", "position_id"], name: "member_id_ministry_id_position_id", using: :btree
  add_index "memberministrypositions", ["ministry_id"], name: "FK__ministries", using: :btree
  add_index "memberministrypositions", ["position_id"], name: "FK__positions", using: :btree

  create_table "members", primary_key: "Id", force: true do |t|
    t.string "FirstName", limit: 50, null: false
    t.string "LastName", limit: 50, null: false
    t.date "BirthDate"
    t.date "ConvertionDate"
    t.string "Address", limit: 100
    t.string "HomePhone", limit: 10
    t.string "CellPhone", limit: 10
    t.date "BaptismDate"
    t.string "Photo", limit: 100
    t.boolean "Active", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ministries", primary_key: "Id", force: true do |t|
    t.string "Description", limit: 50, null: false
    t.boolean "Active", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movements", primary_key: "Id", force: true do |t|
    t.date "MovementDate", null: false
    t.string "Comments", limit: 500, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "movementsdetails", id: false, force: true do |t|
    t.integer "Id", null: false
    t.integer "movement_id", null: false
    t.integer "movementtype_id"
    t.integer "entitytype_id"
    t.string "entityReference", limit: 200, null: false
    t.integer "asset_id", null: false
    t.integer "assetQuantity", null: false
    t.string "Comment", limit: 50
  end

  add_index "movementsdetails", ["asset_id"], name: "FK_movementsdetail_assets", using: :btree
  add_index "movementsdetails", ["entitytype_id"], name: "FK_movementsdetail_entitytypes", using: :btree
  add_index "movementsdetails", ["movement_id"], name: "FK_movementsdetail_movements", using: :btree
  add_index "movementsdetails", ["movementtype_id"], name: "FK_movementsdetail_movementtypes", using: :btree

  create_table "movementtypes", primary_key: "Id", force: true do |t|
    t.string "Description", limit: 100, null: false
    t.boolean "Active", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", primary_key: "Id", force: true do |t|
    t.string "Description", limit: 50, null: false
    t.boolean "Active", default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", primary_key: "Id", force: true do |t|
    t.string "UserName", limit: 12, null: false
    t.string "FullName", limit: 150, null: false
    t.string "Email", limit: 150
    t.string "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "Active"
  end

  add_index "users", ["UserName"], name: "index_users_on_UserName", unique: true, using: :btree

end
