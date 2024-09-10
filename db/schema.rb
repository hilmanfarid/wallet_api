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

ActiveRecord::Schema[7.2].define(version: 2024_09_07_002417) do
  create_table "accounts", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", unsigned: true
    t.string "account_number", limit: 32, null: false
    t.string "account_name", limit: 64, null: false
    t.integer "status", limit: 1, unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_number"], name: "index_accounts_on_account_number", unique: true
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "deposits", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "account_id", unsigned: true
    t.decimal "amount", precision: 15, scale: 3, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_deposits_on_account_id"
  end

  create_table "transactions", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false, unsigned: true
    t.bigint "deposit_id", unsigned: true
    t.bigint "withdrawal_id", unsigned: true
    t.bigint "source_account_id", unsigned: true
    t.bigint "destination_account_id", unsigned: true
    t.integer "state", limit: 1, unsigned: true
    t.decimal "amount", precision: 15, scale: 3, null: false
    t.datetime "succeeded_at"
    t.datetime "failed_at"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deposit_id"], name: "fk_rails_9a0a6afbd0"
    t.index ["destination_account_id"], name: "fk_rails_f7070c25b3"
    t.index ["source_account_id"], name: "fk_rails_3da53813c7"
    t.index ["user_id"], name: "fk_rails_77364e6416"
    t.index ["withdrawal_id"], name: "fk_rails_9846280b01"
  end

  create_table "users", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username", limit: 64, null: false
    t.string "crypted_password", null: false
    t.string "secret"
    t.string "token"
    t.integer "status", limit: 1, unsigned: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "withdrawals", id: { type: :bigint, unsigned: true }, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "account_id", unsigned: true
    t.decimal "amount", precision: 15, scale: 3, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_withdrawals_on_account_id"
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "deposits", "accounts"
  add_foreign_key "transactions", "accounts", column: "destination_account_id"
  add_foreign_key "transactions", "accounts", column: "source_account_id"
  add_foreign_key "transactions", "deposits"
  add_foreign_key "transactions", "users"
  add_foreign_key "transactions", "withdrawals"
  add_foreign_key "withdrawals", "accounts"
end
