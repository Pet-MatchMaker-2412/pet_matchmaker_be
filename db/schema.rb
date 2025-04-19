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

ActiveRecord::Schema[7.1].define(version: 2025_04_19_012344) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "text"
    t.bigint "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "questionnaire_submissions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "recommended_animal_id", null: false
    t.index ["recommended_animal_id"], name: "index_questionnaire_submissions_on_recommended_animal_id"
    t.index ["user_id"], name: "index_questionnaire_submissions_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommended_animals", force: :cascade do |t|
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recommended_animals_weights", force: :cascade do |t|
    t.float "weight"
    t.bigint "recommended_animal_id", null: false
    t.bigint "answer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_recommended_animals_weights_on_answer_id"
    t.index ["recommended_animal_id"], name: "index_recommended_animals_weights_on_recommended_animal_id"
  end

  create_table "submission_answers", force: :cascade do |t|
    t.bigint "questionnaire_submission_id", null: false
    t.bigint "answer_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_id"], name: "index_submission_answers_on_answer_id"
    t.index ["questionnaire_submission_id"], name: "index_submission_answers_on_questionnaire_submission_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "questionnaire_submissions", "recommended_animals"
  add_foreign_key "questionnaire_submissions", "users"
  add_foreign_key "recommended_animals_weights", "answers"
  add_foreign_key "recommended_animals_weights", "recommended_animals"
  add_foreign_key "submission_answers", "answers"
  add_foreign_key "submission_answers", "questionnaire_submissions"
end
