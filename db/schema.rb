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

ActiveRecord::Schema.define(version: 35) do
  create_table 'agencies', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name',      null: false
    t.string 'ip_address', null: false
  end

  create_table 'archives', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.text     'content', limit: 65_535
    t.integer  'incident_id',                    null: false
    t.integer  'sender_id',                      null: false
    t.integer  'receiver_id',                    null: false
    t.string   'ip_address_sender',               null: false
    t.datetime 'created_at',                     null: false
    t.datetime 'updated_at',                     null: false
    t.index ['incident_id'], name: 'index_archives_on_incident_id', using: :btree
    t.index ['receiver_id'], name: 'index_archives_on_receiver_id', using: :btree
    t.index ['sender_id'], name: 'index_archives_on_sender_id', using: :btree
  end

  create_table 'categories', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name', null: false
  end

  create_table 'detentor_types', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name', null: false
  end

  create_table 'field_agencies', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name', null: false
  end

  create_table 'field_agency_agencies', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'agency_id'
    t.integer 'field_agency_id'
    t.text    'content',         limit: 65_535, null: false
    t.index ['agency_id'], name: 'index_field_agency_agencies_on_agency_id', using: :btree
    t.index ['field_agency_id'], name: 'index_field_agency_agencies_on_field_agency_id', using: :btree
  end

  create_table 'field_seller_sellers', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'field_seller_id'
    t.integer 'seller_id'
    t.text    'content',         limit: 65_535, null: false
    t.index ['field_seller_id'], name: 'index_field_seller_sellers_on_field_seller_id', using: :btree
    t.index ['seller_id'], name: 'index_field_seller_sellers_on_seller_id', using: :btree
  end

  create_table 'field_sellers', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name', null: false
  end

  create_table 'field_type_user_type_users', id: false, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'type_user_id'
    t.integer 'field_type_user_id'
    t.index ['field_type_user_id'], name: 'index_field_type_user_type_users_on_field_type_user_id', using: :btree
    t.index ['type_user_id'], name: 'index_field_type_user_type_users_on_type_user_id', using: :btree
  end

  create_table 'field_type_users', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name', null: false
  end

  create_table 'field_users', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'field_type_user_id'
    t.integer 'user_id'
    t.text    'content',            limit: 65_535
    t.index ['field_type_user_id'], name: 'index_field_users_on_field_type_user_id', using: :btree
    t.index ['user_id'], name: 'index_field_users_on_user_id', using: :btree
  end

  create_table 'file_archives', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'archive_id', null: false
    t.string  'file'
    t.integer 'file_size'
    t.string  'content_type'
    t.index ['archive_id'], name: 'index_file_archives_on_archive_id', using: :btree
  end

  create_table 'file_incidents', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'incident_id', null: false
    t.string  'file'
    t.integer 'file_size'
    t.string  'content_type'
    t.index ['incident_id'], name: 'index_file_incidents_on_incident_id', using: :btree
  end

  create_table 'file_procedures', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'procedure_id', null: false
    t.string  'file'
    t.integer 'file_size'
    t.string  'content_type'
    t.index ['procedure_id'], name: 'index_file_procedures_on_procedure_id', using: :btree
  end

  create_table 'file_responses', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'response_id',  null: false
    t.string  'file'
    t.integer 'file_size'
    t.string  'content_type'
    t.index ['response_id'], name: 'index_file_responses_on_response_id', using: :btree
  end

  create_table 'file_users', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'user_id', null: false
    t.string  'file'
    t.integer 'file_size'
    t.string  'content_type'
    t.index ['user_id'], name: 'index_file_users_on_user_id', using: :btree
  end

  create_table 'incidents', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'title',                         limit: 200,   null: false
    t.text     'content',                       limit: 65_535, null: false
    t.integer  'user_id',                                     null: false
    t.integer  'tech_id',                                     null: false
    t.integer  'category_id',                                 null: false
    t.integer  'sous_category_id',                            null: false
    t.integer  'lvl_urgence_user',              limit: 1,     null: false
    t.integer  'lvl_urgence_tech',              limit: 1,     null: false
    t.integer  'lvl_of_incident'
    t.boolean  'cloture_user',                                null: false
    t.boolean  'cloture_tech',                                null: false
    # t.integer  "pc_id",                                       null: false
    t.string   'ip_address',                                   null: false
    # t.text     "solution",                      limit: 65535
    # t.string   "keywords"
    # t.string   "link_faq"
    t.integer  'incident_state_id_for_user_id'
    t.integer  'incident_state_id_for_tech_id'
    t.datetime 'archived_at'
    t.datetime 'resolved_at'
    t.datetime 'created_at',                                  null: false
    t.datetime 'updated_at',                                  null: false
    t.boolean  'notify_for_tech'
    t.boolean  'notify_for_user'
    t.index ['category_id'], name: 'index_incidents_on_category_id', using: :btree
    t.index ['incident_state_id_for_tech_id'], name: 'index_incidents_on_incident_state_id_for_tech_id', using: :btree
    t.index ['incident_state_id_for_user_id'], name: 'index_incidents_on_incident_state_id_for_user_id', using: :btree
    t.index ['pc_id'], name: 'index_incidents_on_pc_id', using: :btree
    t.index ['sous_category_id'], name: 'index_incidents_on_sous_category_id', using: :btree
    t.index ['tech_id'], name: 'index_incidents_on_tech_id', using: :btree
    t.index ['user_id'], name: 'index_incidents_on_user_id', using: :btree
  end

  create_table 'incidents_states', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name',       null: false
    t.string 'shortcut',   null: false
    t.string 'user_color', null: false
    t.string 'tech_color', null: false
  end

  create_table 'materials', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer  'type_material_id', null: false
    t.integer  'detentor_type_id', null: false
    t.integer  'detentor_id',      null: false
    t.integer  'seller_id',        null: false
    t.string   'name',             null: false
    t.datetime 'created_at',       null: false
    t.datetime 'updated_at',       null: false
    t.index ['detentor_id'], name: 'index_materials_on_detentor_id', using: :btree
    t.index ['detentor_type_id'], name: 'index_materials_on_detentor_type_id', using: :btree
    t.index ['seller_id'], name: 'index_materials_on_seller_id', using: :btree
    t.index ['type_material_id'], name: 'index_materials_on_type_material_id', using: :btree
  end

  create_table 'procedures', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'nom', null: false
    t.text     'contenu',          limit: 65_535, null: false
    t.text     'resolution',       limit: 65_535, null: false
    t.integer  'category_id',                    null: false
    t.integer  'sous_category_id',               null: false
    t.datetime 'created_at',                     null: false
    t.datetime 'updated_at',                     null: false
    t.index ['category_id'], name: 'index_procedures_on_category_id', using: :btree
    t.index ['sous_category_id'], name: 'index_procedures_on_sous_category_id', using: :btree
  end

  create_table 'responses', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.text     'content',          limit: 65_535
    t.integer  'incident_id',                    null: false
    t.integer  'sender_id',                      null: false
    t.integer  'receiver_id',                    null: false
    t.string   'ip_address_sender',               null: false
    t.datetime 'created_at',                     null: false
    t.datetime 'updated_at',                     null: false
    t.index ['incident_id'], name: 'index_responses_on_incident_id', using: :btree
    t.index ['receiver_id'], name: 'index_responses_on_receiver_id', using: :btree
    t.index ['sender_id'], name: 'index_responses_on_sender_id', using: :btree
  end

  create_table 'rights', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name',    null: false
    t.string 'content', null: false
  end

  create_table 'sellers', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'name',       null: false
    t.boolean  'actif',      null: false
    t.datetime 'created_at', null: false
  end

  create_table 'sous_categories', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string  'name',                      null: false
    t.integer 'category_id',               null: false
    t.integer 'lvl_urgence_max', limit: 2, null: false
    t.index ['category_id'], name: 'index_sous_categories_on_category_id', using: :btree
  end

  create_table 'spec_material_materials', id: false, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'spec_material_id'
    t.integer 'material_id'
    t.index ['material_id'], name: 'index_spec_material_materials_on_material_id', using: :btree
    t.index ['spec_material_id'], name: 'index_spec_material_materials_on_spec_material_id', using: :btree
  end

  create_table 'spec_materials', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'spec_type_material_id', null: false
    t.string  'spec_value',            null: false
    t.index ['spec_type_material_id'], name: 'index_spec_materials_on_spec_type_material_id', using: :btree
  end

  create_table 'spec_type_materials', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name', null: false
  end

  create_table 'type_material_sellers', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'type_material_id'
    t.integer 'seller_id'
    t.index ['seller_id'], name: 'index_type_material_sellers_on_seller_id', using: :btree
    t.index ['type_material_id'], name: 'index_type_material_sellers_on_type_material_id', using: :btree
  end

  create_table 'type_material_spec_type_materials', id: false, force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'type_material_id'
    t.integer 'spec_type_material_id'
    t.index ['spec_type_material_id'], name: 'index_type_material_spec_type_materials_on_spec_type_material_id', using: :btree
    t.index ['type_material_id'], name: 'index_type_material_spec_type_materials_on_type_material_id', using: :btree
  end

  create_table 'type_materials', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'name', null: false
  end

  create_table 'type_user_rights', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.integer 'right_id'
    t.integer 'type_user_id'
    t.boolean 'value', null: false
    t.index ['right_id'], name: 'fk_rails_5bab74ed8d', using: :btree
    t.index ['type_user_id'], name: 'fk_rails_365e43b552', using: :btree
  end

  create_table 'type_users', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string  'name',    null: false
    t.boolean 'secure',  null: false
    t.boolean 'is_tech', null: false
    t.boolean 'actif',   null: false
  end

  create_table 'updates', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'changesMade', null: false
    t.datetime 'created_at',  null: false
  end

  create_table 'users', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string   'pseudo',                      null: false
    t.string   'email',                       null: false
    t.string   'tel',                         null: false
    t.string   'password',                    null: false
    t.string   'salt',                        null: false
    t.string   'name',                        null: false
    t.string   'surname',                     null: false
    t.integer  'type_user_id',                null: false
    t.integer  'agency_id',                   null: false
    t.string   'ip_addr',                     null: false
    t.boolean  'actif', default: true, null: false
    t.datetime 'created_at',                  null: false
    t.datetime 'updated_at',                  null: false
    t.index ['agency_id'], name: 'index_users_on_agency_id', using: :btree
    t.index ['type_user_id'], name: 'index_users_on_type_user_id', using: :btree
  end

  add_foreign_key 'archives', 'incidents'
  add_foreign_key 'field_agency_agencies', 'agencies'
  add_foreign_key 'field_agency_agencies', 'field_agencies'
  add_foreign_key 'field_seller_sellers', 'field_sellers'
  add_foreign_key 'field_seller_sellers', 'sellers'
  add_foreign_key 'field_type_user_type_users', 'field_type_users'
  add_foreign_key 'field_type_user_type_users', 'type_users'
  add_foreign_key 'field_users', 'field_type_users'
  add_foreign_key 'field_users', 'users'
  add_foreign_key 'file_archives', 'archives'
  add_foreign_key 'file_incidents', 'incidents'
  add_foreign_key 'file_procedures', 'procedures'
  add_foreign_key 'file_responses', 'responses'
  add_foreign_key 'file_users', 'users'
  add_foreign_key 'incidents', 'categories'
  add_foreign_key 'incidents', 'pcs'
  add_foreign_key 'incidents', 'sous_categories'
  add_foreign_key 'incidents', 'users'
  add_foreign_key 'materials', 'detentor_types'
  add_foreign_key 'materials', 'sellers'
  add_foreign_key 'materials', 'type_materials'
  add_foreign_key 'procedures', 'categories'
  add_foreign_key 'procedures', 'sous_categories'
  add_foreign_key 'responses', 'incidents'
  add_foreign_key 'sous_categories', 'categories'
  add_foreign_key 'spec_material_materials', 'materials'
  add_foreign_key 'spec_material_materials', 'spec_materials'
  add_foreign_key 'spec_materials', 'spec_type_materials'
  add_foreign_key 'type_material_sellers', 'sellers'
  add_foreign_key 'type_material_sellers', 'type_materials'
  add_foreign_key 'type_material_spec_type_materials', 'spec_type_materials'
  add_foreign_key 'type_material_spec_type_materials', 'type_materials'
  add_foreign_key 'type_user_rights', 'rights'
  add_foreign_key 'type_user_rights', 'type_users'
  add_foreign_key 'users', 'agencies'
  add_foreign_key 'users', 'type_users'
end
