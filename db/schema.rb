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

ActiveRecord::Schema.define(version: 20170523120734) do

  create_table "agencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name",       limit: 45
    t.string "ip_address", limit: 50, collation: "utf8_general_ci"
  end

  create_table "archives", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "content",           limit: 65535
    t.integer  "incident_id"
    t.integer  "sender_id",         limit: 2
    t.integer  "receiver_id",       limit: 2
    t.string   "ip_address_sender",                            collation: "utf8_general_ci"
    t.integer  "pc_id"
    t.datetime "updated_at",                      null: false
    t.datetime "created_at",                      null: false
    t.index ["incident_id"], name: "index_archives_on_incident_id", using: :btree
    t.index ["pc_id"], name: "index_archives_on_pc_id", using: :btree
  end

  create_table "attachments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",       limit: 30
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "detentor_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
  end

  create_table "field_agencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
  end

  create_table "field_agency_agencies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "agency_id",                     default: 0, null: false
    t.integer "field_agency_id",               default: 0, null: false
    t.text    "content",         limit: 65535
  end

  create_table "field_seller_sellers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "field_seller_id",               default: 0, null: false
    t.integer "seller_id",                     default: 0, null: false
    t.text    "content",         limit: 65535
  end

  create_table "field_sellers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
  end

  create_table "field_type_user_type_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "type_user_id"
    t.integer "field_type_user_id"
  end

  create_table "field_type_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
  end

  create_table "field_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "field_type_user_id"
    t.integer "user_id"
    t.text    "content",            limit: 65535
  end

  create_table "file_archives", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "archive_id"
    t.string   "file"
    t.integer  "file_size"
    t.string   "content_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "file_incidents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "incident_id"
    t.string   "file"
    t.integer  "file_size"
    t.string   "content_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "file_procedures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "procedure_id"
    t.string   "file"
    t.integer  "file_size"
    t.string   "content_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "file_responses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "response_id"
    t.string   "file"
    t.integer  "file_size"
    t.string   "content_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "file_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "user_id"
    t.string   "file"
    t.integer  "file_size"
    t.string   "content_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "incidents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "title",                         limit: 200
    t.text     "content",                       limit: 65535
    t.integer  "user_id",                       limit: 2
    t.integer  "tech_id",                       limit: 2
    t.integer  "category_id",                   limit: 2
    t.integer  "sous_category_id",              limit: 2
    t.integer  "lvl_urgence_user",              limit: 1
    t.integer  "lvl_urgence_tech",              limit: 1
    t.boolean  "cloture_user"
    t.boolean  "cloture_tech"
    t.integer  "pc_id"
    t.string   "ip_address",                                               collation: "utf8_general_ci"
    t.text     "solution",                      limit: 65535
    t.string   "keywords"
    t.string   "link_faq"
    t.integer  "incident_state_id_for_user_id", limit: 1
    t.integer  "incident_state_id_for_tech_id", limit: 1
    t.integer  "lvl_of_incident"
    t.datetime "archived_at"
    t.datetime "resolved_at"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.boolean  "notify_for_tech"
    t.boolean  "notify_for_user"
    t.index ["pc_id"], name: "index_incidents_on_pc_id", using: :btree
  end

  create_table "incidents_states", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.string "shortcut"
    t.string "user_color", limit: 45, default: "success"
    t.string "tech_color", limit: 45, default: "success"
  end

  create_table "materials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer  "type_material_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "name"
    t.integer  "seller_id"
    t.integer  "detentor_type_id"
    t.integer  "detentor_id"
  end

  create_table "pcs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text    "name", limit: 65535
    t.text    "ip",   limit: 65535
    t.text    "mac",  limit: 65535
    t.integer "user"
    t.index ["user"], name: "index_pcs_on_user", using: :btree
  end

  create_table "procedures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "nom"
    t.text     "contenu",          limit: 65535
    t.text     "resolution",       limit: 65535
    t.integer  "category_id"
    t.integer  "sous_category_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "responses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "content",           limit: 65535
    t.integer  "incident_id"
    t.integer  "sender_id",         limit: 2
    t.integer  "receiver_id",       limit: 2
    t.string   "ip_address_sender",                            collation: "utf8_general_ci"
    t.integer  "pc_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.index ["incident_id"], name: "index_responses_on_incident_id", using: :btree
    t.index ["pc_id"], name: "index_responses_on_pc_id", using: :btree
  end

  create_table "rights", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
    t.string "content"
  end

  create_table "sellers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.datetime "created_at", null: false
    t.string   "name"
    t.boolean  "actif"
  end

  create_table "sous_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "name",            limit: 30
    t.integer  "category_id"
    t.integer  "lvl_urgence_max", limit: 2
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["category_id"], name: "index_sous_categories_on_category_id", using: :btree
  end

  create_table "spec_material_materials", primary_key: ["material_id", "spec_material_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "spec_material_id", null: false
    t.integer "material_id",      null: false
  end

  create_table "spec_materials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "spec_type_material_id"
    t.string  "spec_value"
  end

  create_table "spec_type_materials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
  end

  create_table "type_material_sellers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "type_material_id", default: 0, null: false
    t.integer "seller_id",        default: 0, null: false
  end

  create_table "type_material_spec_type_materials", primary_key: ["type_material_id", "spec_type_material_id"], force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "type_material_id",      null: false
    t.integer "spec_type_material_id", null: false
  end

  create_table "type_materials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "name"
  end

  create_table "type_user_rights", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "right_id",     default: 0, null: false
    t.integer "type_user_id", default: 0, null: false
    t.boolean "value",                    null: false
  end

  create_table "type_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string  "name"
    t.boolean "secure"
    t.boolean "is_tech"
    t.boolean "actif"
  end

  create_table "updates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.text     "changesMade", limit: 65535
    t.datetime "created_at",                null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string   "pseudo",       limit: 100
    t.string   "email"
    t.string   "tel",          limit: 30
    t.string   "password"
    t.string   "salt"
    t.integer  "agency_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "ip_addr",      limit: 20
    t.integer  "type_user_id"
    t.boolean  "actif"
    t.string   "name"
    t.string   "surname"
    t.index ["agency_id"], name: "index_users_on_agency_id", using: :btree
  end

end
