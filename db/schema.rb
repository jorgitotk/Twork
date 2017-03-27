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

ActiveRecord::Schema.define(version: 20151130002111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "work_groups", force: :cascade do |t|
    t.string   "name",        null: false
    t.integer  "owner_id",    null: false
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.integer  "work_group_id", null: false, index: {name: "fk__tasks_work_group_id"}, foreign_key: {references: "work_groups", name: "fk_tasks_work_group_id", on_update: :no_action, on_delete: :no_action}
    t.string   "name",          null: false
    t.text     "description"
    t.integer  "status",        default: 0, null: false
    t.datetime "start_time",    null: false
    t.datetime "end_time",      null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false, index: {name: "index_users_on_email", unique: true}
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token",   index: {name: "index_users_on_reset_password_token", unique: true}
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name",             null: false
    t.string   "last_name",              null: false
    t.string   "phone"
    t.integer  "permission_level"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_has_groups", force: :cascade do |t|
    t.integer  "work_group_id", null: false, index: {name: "fk__user_has_groups_work_group_id"}, foreign_key: {references: "work_groups", name: "fk_user_has_groups_work_group_id", on_update: :no_action, on_delete: :no_action}
    t.integer  "user_id",       null: false, index: {name: "fk__user_has_groups_user_id"}, foreign_key: {references: "users", name: "fk_user_has_groups_user_id", on_update: :no_action, on_delete: :no_action}
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "assigned_tasks", force: :cascade do |t|
    t.integer  "user_has_group_id", null: false, index: {name: "fk__assigned_tasks_user_has_group_id"}, foreign_key: {references: "user_has_groups", name: "fk_assigned_tasks_user_has_group_id", on_update: :no_action, on_delete: :no_action}
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "task_id",           index: {name: "fk__assigned_tasks_task_id"}, foreign_key: {references: "tasks", name: "fk_assigned_tasks_task_id", on_update: :no_action, on_delete: :no_action}
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    index: {name: "fk__comments_user_id"}, foreign_key: {references: "users", name: "fk_comments_user_id", on_update: :no_action, on_delete: :no_action}
    t.integer  "task_id",    index: {name: "fk__comments_task_id"}, foreign_key: {references: "tasks", name: "fk_comments_task_id", on_update: :no_action, on_delete: :no_action}
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "file_tasks", force: :cascade do |t|
    t.integer  "task_id",            index: {name: "fk__file_tasks_task_id"}, foreign_key: {references: "tasks", name: "fk_file_tasks_task_id", on_update: :no_action, on_delete: :no_action}
    t.integer  "user_id",            index: {name: "fk__file_tasks_user_id"}, foreign_key: {references: "users", name: "fk_file_tasks_user_id", on_update: :no_action, on_delete: :no_action}
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "title"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

end
