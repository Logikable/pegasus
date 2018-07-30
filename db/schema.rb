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

ActiveRecord::Schema.define(version: 2018_07_30_050650) do

  create_table "project_collaborators", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.string "owner"
    t.string "stakeholders"
    t.string "description"
    t.string "tasks"
    t.string "milestones"
    t.integer "team_id", default: 1
    t.boolean "done"
    t.string "office"
    t.string "priority"
    t.date "deadline"
  end

  create_table "stars", force: :cascade do |t|
    t.integer "project_id"
    t.integer "starrer_id"
    t.integer "starree_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_stars_on_project_id"
    t.index ["starree_id"], name: "index_stars_on_starree_id"
    t.index ["starrer_id"], name: "index_stars_on_starrer_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "updates", force: :cascade do |t|
    t.string "description"
    t.string "resource_type"
    t.integer "resource_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.string "uid"
    t.string "name"
    t.string "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "image"
    t.integer "xp"
    t.integer "team_id", default: 1
    t.string "role"
  end

end
