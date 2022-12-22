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

ActiveRecord::Schema[7.0].define(version: 2022_12_22_085700) do
  create_table "active_admin_comments", charset: "utf8mb4", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "companies", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "line_item_dates", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "quote_id", null: false
    t.date "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["date", "quote_id"], name: "index_line_item_dates_on_date_and_quote_id", unique: true
    t.index ["date"], name: "index_line_item_dates_on_date"
    t.index ["quote_id"], name: "index_line_item_dates_on_quote_id"
  end

  create_table "line_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "line_item_date_id", null: false
    t.string "name", null: false
    t.text "description"
    t.integer "quantity", null: false
    t.decimal "unit_price", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_item_date_id"], name: "index_line_items_on_line_item_date_id"
  end

  create_table "logs", charset: "utf8mb4", force: :cascade do |t|
    t.text "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.bigint "task_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["task_id"], name: "index_logs_on_task_id"
    t.index ["user_id"], name: "index_logs_on_user_id"
  end

  create_table "products", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.bigint "user_id", null: false
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "color", default: "#cococo"
    t.index ["company_id"], name: "index_products_on_company_id"
    t.index ["user_id"], name: "index_products_on_user_id"
  end

  create_table "project_statuses", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.bigint "user_id", null: false
    t.bigint "product_id", null: false
    t.bigint "project_status_id", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_projects_on_product_id"
    t.index ["project_status_id"], name: "index_projects_on_project_status_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "quotes", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.boolean "active", default: false
    t.string "author"
    t.index ["company_id"], name: "index_quotes_on_company_id"
  end

  create_table "task_statuses", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.bigint "task_status_id", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
    t.index ["task_status_id"], name: "index_tasks_on_task_status_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.string "name"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "line_item_dates", "quotes"
  add_foreign_key "line_items", "line_item_dates"
  add_foreign_key "logs", "tasks"
  add_foreign_key "logs", "users"
  add_foreign_key "products", "companies"
  add_foreign_key "products", "users"
  add_foreign_key "projects", "products"
  add_foreign_key "projects", "project_statuses"
  add_foreign_key "projects", "users"
  add_foreign_key "tasks", "projects"
  add_foreign_key "tasks", "task_statuses"
  add_foreign_key "tasks", "users"
end
