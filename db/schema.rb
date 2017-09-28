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

ActiveRecord::Schema.define(version: 20170917010950) do

  create_table "armor_slots", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "armors", force: :cascade do |t|
    t.integer "armor_slot_id"
    t.integer "weight_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
    t.index ["armor_slot_id"], name: "index_armors_on_armor_slot_id"
    t.index ["item_id"], name: "index_armors_on_item_id"
    t.index ["weight_class_id"], name: "index_armors_on_weight_class_id"
  end

  create_table "i_flags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "i_flags_items", id: false, force: :cascade do |t|
    t.integer "i_flag_id"
    t.integer "item_id"
    t.index ["i_flag_id"], name: "index_i_flags_items_on_i_flag_id"
    t.index ["item_id"], name: "index_i_flags_items_on_item_id"
  end

  create_table "i_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer "gid"
    t.string "name"
    t.string "chat_link"
    t.string "icon"
    t.integer "level"
    t.integer "rarity_id"
    t.integer "i_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["i_type_id"], name: "index_items_on_i_type_id"
    t.index ["rarity_id"], name: "index_items_on_rarity_id"
  end

  create_table "items_offers", id: false, force: :cascade do |t|
    t.integer "item_id"
    t.integer "offer_id"
    t.index ["item_id"], name: "index_items_offers_on_item_id"
    t.index ["offer_id"], name: "index_items_offers_on_offer_id"
  end

  create_table "offers", force: :cascade do |t|
    t.integer "listings"
    t.integer "price"
    t.integer "quantity"
    t.integer "order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_offers_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rarities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapon_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.integer "weapon_type_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_weapons_on_item_id"
    t.index ["weapon_type_id"], name: "index_weapons_on_weapon_type_id"
  end

  create_table "weight_classes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
