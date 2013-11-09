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

ActiveRecord::Schema.define(version: 20130600000045) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.integer  "eventable_id"
    t.string   "eventable_type"
    t.integer  "timelineable_id"
    t.string   "timelineable_type"
    t.datetime "created_at"
  end

  add_index "events", ["timelineable_id", "timelineable_type"], name: "index_events_on_timelineable_id_and_timelineable_type", using: :btree

  create_table "organizations", force: true do |t|
    t.string  "type",                           null: false
    t.integer "master_id"
    t.boolean "approved",       default: false, null: false
    t.boolean "declined",       default: false, null: false
    t.boolean "pending",        default: true,  null: false
    t.integer "parent_id"
    t.integer "upload_id"
    t.string  "name",                           null: false
    t.string  "country"
    t.string  "region"
    t.string  "city"
    t.string  "website"
    t.string  "facebook_id"
    t.string  "facebook_alias"
    t.string  "twitter_alias"
  end

  add_index "organizations", ["approved"], name: "index_organizations_on_approved", using: :btree
  add_index "organizations", ["country", "region", "city"], name: "index_organizations_on_country_and_region_and_city", where: "((approved IS TRUE) AND ((type)::text = 'Organization::Master'::text))", using: :btree
  add_index "organizations", ["name"], name: "index_organizations_on_name", where: "((approved IS TRUE) AND ((type)::text = 'Organization::Master'::text))", using: :btree
  add_index "organizations", ["parent_id"], name: "index_organizations_on_parent_id", where: "((approved IS TRUE) AND ((type)::text = 'Organization::Master'::text))", using: :btree
  add_index "organizations", ["pending"], name: "index_organizations_on_pending", using: :btree
  add_index "organizations", ["type"], name: "index_organizations_on_type", using: :btree

  create_table "poll_attributes", force: true do |t|
    t.integer "user_id"
    t.integer "pollable_id",                    null: false
    t.string  "pollable_type",                  null: false
    t.boolean "approved",       default: false, null: false
    t.boolean "declined",       default: false, null: false
    t.boolean "pending",        default: true,  null: false
    t.integer "votes_yea",      default: 0,     null: false
    t.integer "votes_nay",      default: 0,     null: false
    t.integer "votes_sum",      default: 0,     null: false
    t.text    "notes"
    t.integer "comments_count", default: 0,     null: false
  end

  add_index "poll_attributes", ["pollable_id", "pollable_type"], name: "index_poll_attributes_on_pollable_id_and_pollable_type", using: :btree

  create_table "report_evidence", force: true do |t|
    t.string  "citation"
    t.string  "url"
    t.integer "upload_id"
    t.integer "previous_id"
  end

  create_table "report_evidence_joins", force: true do |t|
    t.integer "report_id",   null: false
    t.integer "evidence_id", null: false
  end

  add_index "report_evidence_joins", ["evidence_id"], name: "index_report_evidence_joins_on_evidence_id", using: :btree
  add_index "report_evidence_joins", ["report_id"], name: "index_report_evidence_joins_on_report_id", using: :btree

  create_table "report_participant_joins", force: true do |t|
    t.integer "report_id",      null: false
    t.integer "participant_id", null: false
  end

  add_index "report_participant_joins", ["participant_id"], name: "index_report_participant_joins_on_participant_id", using: :btree
  add_index "report_participant_joins", ["report_id"], name: "index_report_participant_joins_on_report_id", using: :btree

  create_table "report_participants", force: true do |t|
    t.integer "involvement",     default: 0, null: false
    t.string  "summary"
    t.integer "reportable_id",               null: false
    t.string  "reportable_type",             null: false
    t.integer "previous_id"
  end

  add_index "report_participants", ["reportable_type", "reportable_id"], name: "index_report_participants_by_reportable", using: :btree

  create_table "report_responses", force: true do |t|
    t.integer  "user_id",                null: false
    t.integer  "report_id",              null: false
    t.integer  "value",      default: 0, null: false
    t.datetime "created_at"
  end

  add_index "report_responses", ["report_id"], name: "index_report_responses_on_report_id", using: :btree
  add_index "report_responses", ["user_id"], name: "index_report_responses_on_user_id", using: :btree

  create_table "reportable_attributes", force: true do |t|
    t.integer "reportable_id",               null: false
    t.string  "reportable_type",             null: false
    t.integer "report_count",    default: 0, null: false
    t.integer "controversy",     default: 0, null: false
    t.integer "favor",           default: 0, null: false
  end

  add_index "reportable_attributes", ["controversy"], name: "index_reportable_attributes_on_controversy", using: :btree
  add_index "reportable_attributes", ["favor"], name: "index_reportable_attributes_on_favor", using: :btree
  add_index "reportable_attributes", ["report_count"], name: "index_reportable_attributes_on_report_count", using: :btree
  add_index "reportable_attributes", ["reportable_id", "reportable_type"], name: "reportable_attributes_reportable_index", using: :btree

  create_table "reports", force: true do |t|
    t.string  "type",                                 null: false
    t.integer "master_id"
    t.boolean "approved",             default: false, null: false
    t.boolean "declined",             default: false, null: false
    t.boolean "pending",              default: true,  null: false
    t.string  "summary"
    t.text    "description"
    t.integer "responses_sum",        default: 0,     null: false
    t.integer "responses_approve",    default: 0,     null: false
    t.integer "responses_disapprove", default: 0,     null: false
    t.integer "controversy",          default: 0,     null: false
    t.integer "disinterest",          default: 0,     null: false
  end

  add_index "reports", ["approved"], name: "index_reports_on_approved", using: :btree
  add_index "reports", ["controversy"], name: "index_reports_on_controversy", using: :btree
  add_index "reports", ["disinterest"], name: "index_reports_on_disinterest", using: :btree
  add_index "reports", ["pending"], name: "index_reports_on_pending", using: :btree
  add_index "reports", ["responses_approve"], name: "index_reports_on_responses_approve", using: :btree
  add_index "reports", ["responses_disapprove"], name: "index_reports_on_responses_disapprove", using: :btree
  add_index "reports", ["responses_sum"], name: "index_reports_on_responses_sum", using: :btree
  add_index "reports", ["type"], name: "index_reports_on_type", using: :btree

  create_table "uploads", force: true do |t|
    t.string   "file",       null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
  end

  create_table "user_archivist_stats", force: true do |t|
    t.integer "user_id",                       null: false
    t.integer "submitted_records", default: 0, null: false
    t.integer "accepted_records",  default: 0, null: false
    t.integer "rejected_records",  default: 0, null: false
    t.integer "submitted_edits",   default: 0, null: false
    t.integer "accepted_edits",    default: 0, null: false
    t.integer "rejected_edits",    default: 0, null: false
    t.integer "details_provided",  default: 0, null: false
  end

  add_index "user_archivist_stats", ["user_id"], name: "index_user_archivist_stats_on_user_id", using: :btree

  create_table "user_author_stats", force: true do |t|
    t.integer "user_id",              null: false
    t.integer "articles", default: 0, null: false
    t.integer "sections", default: 0, null: false
    t.integer "edits",    default: 0, null: false
  end

  add_index "user_author_stats", ["user_id"], name: "index_user_author_stats_on_user_id", using: :btree

  create_table "user_community_stats", force: true do |t|
    t.integer "user_id",                        null: false
    t.integer "threads_started",    default: 0, null: false
    t.integer "comments_made",      default: 0, null: false
    t.integer "comment_popularity", default: 0, null: false
    t.integer "posts_made",         default: 0, null: false
    t.integer "post_popularity",    default: 0, null: false
  end

  add_index "user_community_stats", ["user_id"], name: "index_user_community_stats_on_user_id", using: :btree

  create_table "user_designer_stats", force: true do |t|
    t.integer "user_id",                          null: false
    t.integer "submitted_wireframes", default: 0, null: false
    t.integer "accepted_wireframes",  default: 0, null: false
    t.integer "rejected_wireframes",  default: 0, null: false
    t.integer "submitted_art_assets", default: 0, null: false
    t.integer "accepted_art_assets",  default: 0, null: false
    t.integer "rejected_art_assets",  default: 0, null: false
  end

  add_index "user_designer_stats", ["user_id"], name: "index_user_designer_stats_on_user_id", using: :btree

  create_table "user_developer_stats", force: true do |t|
    t.integer "user_id",                      null: false
    t.integer "ruby_lines",       default: 0, null: false
    t.integer "javascript_lines", default: 0, null: false
    t.integer "html_lines",       default: 0, null: false
    t.integer "total_lines",      default: 0, null: false
  end

  add_index "user_developer_stats", ["user_id"], name: "index_user_developer_stats_on_user_id", using: :btree

  create_table "user_marketer_stats", force: true do |t|
    t.integer "user_id",                        null: false
    t.integer "facebook_shares",    default: 0, null: false
    t.integer "google_plus_shares", default: 0, null: false
    t.integer "tweets",             default: 0, null: false
    t.integer "click_throughs",     default: 0, null: false
  end

  add_index "user_marketer_stats", ["user_id"], name: "index_user_marketer_stats_on_user_id", using: :btree

  create_table "user_organizer_stats", force: true do |t|
    t.integer "user_id",                          null: false
    t.integer "submitted_projects",   default: 0, null: false
    t.integer "accepted_projects",    default: 0, null: false
    t.integer "rejected_projects",    default: 0, null: false
    t.integer "abandoned_projects",   default: 0, null: false
    t.integer "completed_projects",   default: 0, null: false
    t.integer "project_participants", default: 0, null: false
    t.integer "project_popularity",   default: 0, null: false
  end

  add_index "user_organizer_stats", ["user_id"], name: "index_user_organizer_stats_on_user_id", using: :btree

  create_table "user_translator_stats", force: true do |t|
    t.integer "user_id",                            null: false
    t.integer "submitted_translations", default: 0, null: false
    t.integer "accepted_translations",  default: 0, null: false
    t.integer "rejected_translations",  default: 0, null: false
    t.integer "submitted_edits",        default: 0, null: false
    t.integer "accepted_edits",         default: 0, null: false
    t.integer "rejected_edits",         default: 0, null: false
  end

  add_index "user_translator_stats", ["user_id"], name: "index_user_translator_stats_on_user_id", using: :btree

  create_table "user_whistlr_stats", force: true do |t|
    t.integer "user_id",                       null: false
    t.integer "submitted_reports", default: 0, null: false
    t.integer "accepted_reports",  default: 0, null: false
    t.integer "rejected_reports",  default: 0, null: false
    t.integer "submitted_edits",   default: 0, null: false
    t.integer "accepted_edits",    default: 0, null: false
    t.integer "rejected_edits",    default: 0, null: false
    t.integer "details_provided",  default: 0, null: false
    t.integer "report_popularity", default: 0, null: false
  end

  add_index "user_whistlr_stats", ["user_id"], name: "index_user_whistlr_stats_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.boolean  "active",                                         default: true, null: false
    t.text     "bio"
    t.date     "birthday"
    t.string   "location"
    t.string   "twitter_name"
    t.string   "name",                                                          null: false
    t.string   "website"
    t.decimal  "whuffie",                precision: 6, scale: 4, default: 0.0,  null: false
    t.integer  "developer_reputation",                           default: 0,    null: false
    t.integer  "designer_reputation",                            default: 0,    null: false
    t.integer  "whistlr_reputation",                             default: 0,    null: false
    t.integer  "archivist_reputation",                           default: 0,    null: false
    t.integer  "marketer_reputation",                            default: 0,    null: false
    t.integer  "organizer_reputation",                           default: 0,    null: false
    t.integer  "community_reputation",                           default: 0,    null: false
    t.integer  "translator_reputation",                          default: 0,    null: false
    t.integer  "author_reputation",                              default: 0,    null: false
    t.integer  "follow_count",                                   default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                                          default: "",   null: false
    t.string   "encrypted_password",                             default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                  default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",                                default: 0,    null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "authentication_token"
  end

  add_index "users", ["active"], name: "index_users_on_active", using: :btree
  add_index "users", ["archivist_reputation"], name: "index_users_on_archivist_reputation", using: :btree
  add_index "users", ["author_reputation"], name: "index_users_on_author_reputation", using: :btree
  add_index "users", ["community_reputation"], name: "index_users_on_community_reputation", using: :btree
  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["designer_reputation"], name: "index_users_on_designer_reputation", using: :btree
  add_index "users", ["developer_reputation"], name: "index_users_on_developer_reputation", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["follow_count"], name: "index_users_on_follow_count", using: :btree
  add_index "users", ["marketer_reputation"], name: "index_users_on_marketer_reputation", using: :btree
  add_index "users", ["name"], name: "index_users_on_name", using: :btree
  add_index "users", ["organizer_reputation"], name: "index_users_on_organizer_reputation", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["translator_reputation"], name: "index_users_on_translator_reputation", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", unique: true, using: :btree
  add_index "users", ["whistlr_reputation"], name: "index_users_on_whistlr_reputation", using: :btree
  add_index "users", ["whuffie"], name: "index_users_on_whuffie", using: :btree

  create_table "version_attributes", force: true do |t|
    t.integer "versionable_id",                   null: false
    t.string  "versionable_type",                 null: false
    t.integer "previous_id"
    t.string  "previous_type"
    t.boolean "initial",          default: false, null: false
  end

  add_index "version_attributes", ["versionable_id", "versionable_type"], name: "index_version_attributes_on_versionable_id_and_versionable_type", using: :btree

  create_table "votes", force: true do |t|
    t.integer  "user_id"
    t.integer  "voteable_id"
    t.string   "voteable_type"
    t.integer  "value"
    t.datetime "created_at"
  end

  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree
  add_index "votes", ["voteable_id", "voteable_type"], name: "index_votes_on_voteable_id_and_voteable_type", using: :btree

end
