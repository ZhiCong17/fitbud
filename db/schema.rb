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

ActiveRecord::Schema[7.1].define(version: 2024_06_07_082721) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercise_plans", force: :cascade do |t|
    t.integer "set"
    t.integer "repetitions"
    t.integer "suggested_day"
    t.integer "duration"
    t.bigint "exercise_id", null: false
    t.bigint "plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_exercise_plans_on_exercise_id"
    t.index ["plan_id"], name: "index_exercise_plans_on_plan_id"
  end

  create_table "exercises", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "exercise_plan_id"
    t.index ["exercise_plan_id"], name: "index_exercises_on_exercise_plan_id"
  end

  create_table "plans", force: :cascade do |t|
    t.integer "progress"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "trackers", force: :cascade do |t|
    t.integer "repetitions"
    t.integer "weight"
    t.bigint "exercise_plan_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_plan_id"], name: "index_trackers_on_exercise_plan_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.string "gender"
    t.integer "height"
    t.integer "weight"
    t.integer "age"
    t.string "fitness_goal"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "exercise_plans", "exercises"
  add_foreign_key "exercise_plans", "plans"
  add_foreign_key "exercises", "exercise_plans"
  add_foreign_key "plans", "users"
  add_foreign_key "trackers", "exercise_plans"
end
