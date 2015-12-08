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

ActiveRecord::Schema.define(version: 20151208082244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "issues", force: :cascade do |t|
    t.string   "site_id"
    t.float    "avoid_redirects_impact_m"
    t.string   "avoid_redirects_summary_m"
    t.float    "avoid_redirects_impact_d"
    t.string   "avoid_redirects_summary_d"
    t.float    "enable_compression_impact_m"
    t.string   "enable_compression_summary_m"
    t.float    "enable_compression_impact_d"
    t.string   "enable_compression_summary_d"
    t.float    "response_time_impact_m"
    t.string   "response_time_summary_m"
    t.float    "response_time_impact_d"
    t.string   "response_time_summary_d"
    t.float    "browser_caching_impact_m"
    t.string   "browser_caching_summary_m"
    t.float    "browser_caching_impact_d"
    t.string   "browser_caching_summary_d"
    t.float    "minify_javaScript_impact_m"
    t.string   "minify_javaScript_summary_m"
    t.float    "minify_javaScript_impact_d"
    t.string   "minify_javaScript_summary_d"
    t.float    "minify_html_impact_m"
    t.string   "minify_html_summary_m"
    t.float    "minify_html_impact_d"
    t.string   "minify_html_summary_d"
    t.float    "minify_css_impact_m"
    t.string   "minify_css_summary_m"
    t.float    "minify_css_impact_d"
    t.string   "minify_css_summary_d"
    t.float    "optimize_images_impact_m"
    t.string   "optimize_images_summary_m"
    t.float    "optimize_images_impact_d"
    t.string   "optimize_images_summary_d"
    t.float    "visible_content_impact_m"
    t.string   "visible_content_summary_m"
    t.float    "visible_content_impact_d"
    t.string   "visible_content_summary_d"
    t.string   "minimize_blocking_impact_m"
    t.string   "minimize_blocking_summary_m"
    t.float    "minimize_blocking_impact_d"
    t.float    "avoid_plugins_impact_m"
    t.string   "avoid_plugins_summary_m"
    t.float    "configure_viewport_impact_m"
    t.string   "configure_viewport_summary_m"
    t.float    "size_content_impact_m"
    t.string   "size_content_summary_m"
    t.float    "size_tap_targets_impact_m"
    t.string   "size_tap_targets_summary_m"
    t.float    "legible_font_size_impact_m"
    t.string   "legible_font_size_summary_m"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "name"
  end

  add_index "sites", ["user_id"], name: "index_sites_on_user_id", using: :btree

  create_table "structures", force: :cascade do |t|
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.string   "image_url"
    t.string   "url"
    t.string   "email"
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "omniauth"
  end

  add_index "users", ["provider", "uid"], name: "index_users_on_provider_and_uid", unique: true, using: :btree
  add_index "users", ["provider"], name: "index_users_on_provider", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

  create_table "webstats", force: :cascade do |t|
    t.string   "site_id"
    t.datetime "pull_date"
    t.integer  "desktop_score"
    t.integer  "mobile_score"
    t.integer  "mobile_usability"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "sites", "users"
end
