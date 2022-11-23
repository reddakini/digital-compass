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

ActiveRecord::Schema[7.0].define(version: 2022_11_23_080131) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessments", force: :cascade do |t|
    t.string "pers_type"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "url"
    t.integer "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pathway_skills", force: :cascade do |t|
    t.bigint "pathway_id", null: false
    t.bigint "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pathway_id"], name: "index_pathway_skills_on_pathway_id"
    t.index ["skill_id"], name: "index_pathway_skills_on_skill_id"
  end

  create_table "pathways", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.string "description_short"
    t.text "suit_for"
    t.string "job_roles"
    t.integer "avg_salary"
    t.string "projected_growth"
  end

  create_table "recommendations", force: :cascade do |t|
    t.integer "match_score"
    t.bigint "assessment_id", null: false
    t.bigint "pathway_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_id"], name: "index_recommendations_on_assessment_id"
    t.index ["pathway_id"], name: "index_recommendations_on_pathway_id"
  end

  create_table "recommended_courses", force: :cascade do |t|
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pathway_id", null: false
    t.index ["course_id"], name: "index_recommended_courses_on_course_id"
    t.index ["pathway_id"], name: "index_recommended_courses_on_pathway_id"
  end

  create_table "skill_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.bigint "skill_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_category_id"], name: "index_skills_on_skill_category_id"
  end

  create_table "user_answers", force: :cascade do |t|
    t.integer "question_no"
    t.integer "answer_no"
    t.bigint "user_id", null: false
    t.bigint "assessment_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["assessment_id"], name: "index_user_answers_on_assessment_id"
    t.index ["user_id"], name: "index_user_answers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "avatar_no"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "pathway_skills", "pathways"
  add_foreign_key "pathway_skills", "skills"
  add_foreign_key "recommendations", "assessments"
  add_foreign_key "recommendations", "pathways"
  add_foreign_key "recommended_courses", "courses"
  add_foreign_key "recommended_courses", "pathways"
  add_foreign_key "skills", "skill_categories"
  add_foreign_key "user_answers", "assessments"
  add_foreign_key "user_answers", "users"
end
