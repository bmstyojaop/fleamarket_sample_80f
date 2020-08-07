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

<<<<<<< Updated upstream
ActiveRecord::Schema.define(version: 2020_08_06_033715) do
=======
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 2020_08_06_091952) do

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", null: false
    t.string "ancestry"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "item_conditions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "item_condition", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "item_name", null: false
    t.string "author", null: false
    t.string "company", null: false
    t.integer "price", null: false
    t.text "item_introduction", null: false
    t.bigint "category_id", null: false
    t.bigint "item_condition_id", null: false
    t.bigint "postage_type_id", null: false
    t.bigint "postage_payer_id", null: false
    t.bigint "preparation_day_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_items_on_category_id"
    t.index ["item_condition_id"], name: "index_items_on_item_condition_id"
    t.index ["postage_payer_id"], name: "index_items_on_postage_payer_id"
    t.index ["postage_type_id"], name: "index_items_on_postage_type_id"
    t.index ["preparation_day_id"], name: "index_items_on_preparation_day_id"
  end

  create_table "postage_payers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "postage_payer", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "postage_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "postage_type", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "preparation_days", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "preparation_day", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sending_destinations", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "phone_number"
    t.integer "post_code", null: false
    t.integer "prefecture_code", null: false
    t.string "city", null: false
    t.string "house_number", null: false
    t.string "building_number"
    t.string "destination_family_name", null: false
    t.string "destination_first_name", null: false
    t.string "destination_family_name_kana", null: false
    t.string "destination_first_name_kana", null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_sending_destinations_on_user_id"
  end

ActiveRecord::Schema.define(version: 2020_08_06_225227) do

  create_table "favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "item_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "item_images", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "item_id", null: false
    t.string "url", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end
=======
ActiveRecord::Schema.define(version: 2020_08_06_033715) do
>>>>>>> cf17d494ff6af4bb3374bdcfee2e8ee3013f9616

>>>>>>> Stashed changes

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nickname", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "items", "categories"
  add_foreign_key "items", "item_conditions"
  add_foreign_key "items", "postage_payers"
  add_foreign_key "items", "postage_types"
  add_foreign_key "items", "preparation_days"
end
