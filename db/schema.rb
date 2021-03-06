# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_22_115130) do

  create_table "coins", force: :cascade do |t|
    t.string "coin_api_id"
    t.string "name"
    t.string "symbol"
    t.string "image"
    t.decimal "current_price"
    t.decimal "price_change_percentage_1h_in_currency"
    t.decimal "high_24h"
    t.decimal "low_24h"
    t.decimal "total_volume"
    t.decimal "market_cap"
    t.decimal "market_cap_rank"
    t.decimal "circulating_supply"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "watchlist_coins", force: :cascade do |t|
    t.integer "coin_id", null: false
    t.integer "watchlist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["coin_id"], name: "index_watchlist_coins_on_coin_id"
    t.index ["watchlist_id"], name: "index_watchlist_coins_on_watchlist_id"
  end

  create_table "watchlists", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "watchlist_coins", "coins"
  add_foreign_key "watchlist_coins", "watchlists"
end
