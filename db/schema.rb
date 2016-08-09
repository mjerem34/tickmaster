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

ActiveRecord::Schema.define(version: 20_160_808_092_716) do
  create_table 'agencies', force: :cascade do |t|
    t.string 'name',       limit: 45
    t.string 'adress',     limit: 100
    t.string 'adress2',    limit: 100
    t.string 'adress3',    limit: 100
    t.string 'cp',         limit: 20
    t.string 'city',       limit: 45
    t.string 'email',      limit: 45
    t.string 'tel',        limit: 20
    t.string 'fax',        limit: 20
    t.string 'department', limit: 50
    t.string 'ip_adress',  limit: 50
  end

  create_table 'archives', force: :cascade do |t|
    t.text     'content',             limit: 65_535
    t.integer  'incident_id',         limit: 4
    t.integer  'sender_id',           limit: 2
    t.integer  'receiver_id',         limit: 2
    t.string   'ip_adress_sender',    limit: 255
    t.integer  'pc_id',               limit: 4
    t.string   'attach_file_name',    limit: 255
    t.string   'attach_content_type', limit: 255
    t.integer  'attach_file_size',    limit: 4
    t.datetime 'attach_updated_at'
    t.datetime 'updated_at',                        null: false
    t.datetime 'created_at',                        null: false
  end

  add_index 'archives', ['attach_file_name'], name: 'index_archives_on_attachment_id', using: :btree
  add_index 'archives', ['incident_id'], name: 'index_archives_on_incident_id', using: :btree
  add_index 'archives', ['pc_id'], name: 'index_archives_on_pc_id', using: :btree

  create_table 'automessages', force: :cascade do |t|
    t.string 'title',   limit: 100
    t.text   'content', limit: 65_535
  end

  create_table 'categories', force: :cascade do |t|
    t.string   'name',       limit: 30
    t.datetime 'created_at',            null: false
    t.datetime 'updated_at',            null: false
  end

  create_table 'detentor_types', force: :cascade do |t|
    t.string   'name', limit: 255
    t.datetime 'created_at',             null: false
    t.datetime 'updated_at',             null: false
  end

  create_table 'fields_seller_sellers', force: :cascade do |t|
    t.integer 'field_seller_id', limit: 4
    t.integer 'seller_id',       limit: 4
    t.string  'content',         limit: 255
  end

  create_table 'fields_sellers', force: :cascade do |t|
    t.string   'name', limit: 255
    t.datetime 'created_at',             null: false
    t.datetime 'updated_at',             null: false
  end

  create_table 'file_archives', force: :cascade do |t|
    t.integer  'archive_id',   limit: 4
    t.string   'file',         limit: 255
    t.integer  'file_size',    limit: 4
    t.string   'content_type', limit: 255
    t.datetime 'created_at',               null: false
    t.datetime 'updated_at',               null: false
  end

  create_table 'file_incidents', force: :cascade do |t|
    t.integer  'incident_id',  limit: 4
    t.string   'file',         limit: 255
    t.integer  'file_size',    limit: 4
    t.string   'content_type', limit: 255
    t.datetime 'created_at',               null: false
    t.datetime 'updated_at',               null: false
  end

  create_table 'file_procedures', force: :cascade do |t|
    t.integer  'procedure_id', limit: 4
    t.string   'file',         limit: 255
    t.integer  'file_size',    limit: 4
    t.string   'content_type', limit: 255
    t.datetime 'created_at',               null: false
    t.datetime 'updated_at',               null: false
  end

  create_table 'file_responses', force: :cascade do |t|
    t.integer  'response_id',  limit: 4
    t.string   'file',         limit: 255
    t.integer  'file_size',    limit: 4
    t.string   'content_type', limit: 255
    t.datetime 'created_at',               null: false
    t.datetime 'updated_at',               null: false
  end

  create_table 'file_users', force: :cascade do |t|
    t.integer  'user_id',      limit: 4
    t.string   'file',         limit: 255
    t.integer  'file_size',    limit: 4
    t.string   'content_type', limit: 255
    t.datetime 'created_at',               null: false
    t.datetime 'updated_at',               null: false
  end

  create_table 'incidents', force: :cascade do |t|
    t.string   'title',                         limit: 200
    t.text     'content',                       limit: 65_535
    t.integer  'user_id',                       limit: 2
    t.integer  'tech_id',                       limit: 2
    t.integer  'category_id',                   limit: 2
    t.integer  'sous_category_id',              limit: 2
    t.integer  'agency_id',                     limit: 2
    t.integer  'lvl_urgence_user',              limit: 1
    t.integer  'lvl_urgence_tech',              limit: 1
    t.boolean  'cloture_user'
    t.boolean  'cloture_tech'
    t.integer  'pc_id',                         limit: 4
    t.string   'ip_adress',                     limit: 255
    t.text     'solution',                      limit: 65_535
    t.string   'keywords',                      limit: 255
    t.string   'link_faq',                      limit: 255
    t.integer  'incident_state_id_for_user_id', limit: 1
    t.integer  'incident_state_id_for_tech_id', limit: 1
    t.integer  'lvl_of_incident',               limit: 4
    t.datetime 'archived_at'
    t.datetime 'resolved_at'
    t.string   'attach_file_name',              limit: 255
    t.string   'attach_content_type',           limit: 255
    t.integer  'attach_file_size',              limit: 4
    t.datetime 'attach_updated_at'
    t.datetime 'created_at',                                  null: false
    t.datetime 'updated_at',                                  null: false
    t.boolean  'notify_for_tech'
    t.boolean  'notify_for_user'
  end

  add_index 'incidents', ['pc_id'], name: 'index_incidents_on_pc_id', using: :btree

  create_table 'incidents_states', force: :cascade do |t|
    t.string 'name',     limit: 255
    t.string 'shortcut', limit: 255
  end

  create_table 'mails_waiting', force: :cascade do |t|
    t.string   'sender_mail',        limit: 255
    t.string   'receiver_mail',      limit: 255
    t.string   'object',             limit: 255
    t.text     'content',            limit: 65_535
    t.date     'date_to_attempt'
    t.integer  'number_of_attempts', limit: 4
    t.datetime 'created_at',                       null: false
    t.datetime 'updated_at',                       null: false
  end

  create_table 'materials', force: :cascade do |t|
    t.integer  'type_material_id', limit: 4
    t.integer  'detentor_type_id', limit: 4
    t.integer  'detentor_id',      limit: 4
    t.integer  'seller_id',        limit: 4
    t.datetime 'date'
    t.datetime 'created_at',                 null: false
    t.datetime 'updated_at',                 null: false
  end

  create_table 'procedures', force: :cascade do |t|
    t.string   'nom',              limit: 255
    t.text     'contenu',          limit: 65_535
    t.text     'resolution',       limit: 65_535
    t.integer  'category_id',      limit: 4
    t.integer  'sous_category_id', limit: 4
    t.datetime 'created_at',                     null: false
    t.datetime 'updated_at',                     null: false
  end

  create_table 'responses', force: :cascade do |t|
    t.text     'content',             limit: 65_535
    t.integer  'incident_id',         limit: 4
    t.integer  'sender_id',           limit: 2
    t.integer  'receiver_id',         limit: 2
    t.string   'ip_adress_sender',    limit: 255
    t.integer  'pc_id',               limit: 4
    t.string   'attach_file_name',    limit: 255
    t.string   'attach_content_type', limit: 255
    t.integer  'attach_file_size',    limit: 4
    t.datetime 'attach_updated_at'
    t.datetime 'created_at',                        null: false
    t.datetime 'updated_at',                        null: false
  end

  add_index 'responses', ['incident_id'], name: 'index_responses_on_incident_id', using: :btree
  add_index 'responses', ['pc_id'], name: 'index_responses_on_pc_id', using: :btree

  create_table 'rights', force: :cascade do |t|
    t.string  'name',       limit: 255
    t.string  'content',    limit: 255
    t.boolean 'user'
    t.boolean 'tech'
    t.boolean 'super_tech'
    t.boolean 'admin'
    t.boolean 'disp'
    t.boolean 'assistant'
    t.boolean 'expert'
    t.boolean 'comptable'
  end

  create_table 'sellers', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'sous_categories', force: :cascade do |t|
    t.string   'name',            limit: 30
    t.integer  'category_id',     limit: 4
    t.integer  'lvl_urgence_max', limit: 2
    t.datetime 'created_at',                 null: false
    t.datetime 'updated_at',                 null: false
  end

  add_index 'sous_categories', ['category_id'], name: 'index_sous_categories_on_category_id', using: :btree

  create_table 'spec_material_materials', force: :cascade do |t|
    t.integer 'spec_material_id', limit: 4
    t.integer 'material_id',      limit: 4
  end

  create_table 'specs_materials', force: :cascade do |t|
    t.integer  'spec_type_material_id', limit: 4
    t.string   'spec_value',            limit: 255
    t.datetime 'created_at',                        null: false
    t.datetime 'updated_at',                        null: false
  end

  create_table 'specs_types_materials', force: :cascade do |t|
    t.string 'name', limit: 255
  end

  create_table 'teches', force: :cascade do |t|
    t.string   'name', limit: 40
    t.boolean  'afficher'
    t.boolean  'simple_user'
    t.datetime 'created_at',             null: false
    t.datetime 'updated_at',             null: false
  end

  create_table 'type_materials', force: :cascade do |t|
    t.string   'name', limit: 255
    t.datetime 'created_at',             null: false
    t.datetime 'updated_at',             null: false
  end

  create_table 'types_materials_sellers', force: :cascade do |t|
    t.integer 'type_material_id', limit: 4
    t.integer 'seller_id',        limit: 4
  end

  create_table 'types_materials_spec_materials', force: :cascade do |t|
    t.integer 'type_material_id', limit: 4
    t.integer 'spec_material_id', limit: 4
  end

  create_table 'updates', force: :cascade do |t|
    t.string   'changesMade', limit: 255
    t.datetime 'created_at',              null: false
    t.datetime 'updated_at',              null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string   'pseudo',              limit: 100
    t.string   'email',               limit: 255
    t.string   'tel',                 limit: 30
    t.string   'mobile',              limit: 15
    t.string   'name',                limit: 100
    t.string   'surname',             limit: 100
    t.string   'password',            limit: 255
    t.string   'salt',                limit: 255
    t.integer  'tech_id',             limit: 4
    t.string   'attach_file_name',    limit: 255
    t.string   'attach_content_type', limit: 255
    t.integer  'attach_file_size',    limit: 4
    t.datetime 'attach_updated_at'
    t.integer  'agency_id', limit: 4
    t.datetime 'created_at',                      null: false
    t.datetime 'updated_at',                      null: false
    t.string   'mode',                limit: 255
    t.string   'ip_addr',             limit: 20
    t.boolean  'maj'
  end

  add_index 'users', ['agency_id'], name: 'index_users_on_agency_id', using: :btree
  add_index 'users', ['tech_id'], name: 'index_users_on_tech_id', using: :btree
end
