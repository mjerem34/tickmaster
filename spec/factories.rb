require 'faker'
FactoryGirl.define do
  factory :attachment do
    file "MyString"
  end
  factory :admin, class: User do |f|
    f.surname { Faker::Name.first_name }
    f.name { Faker::Name.last_name }
    f.pseudo { Faker::Internet.user_name }
    f.password 'password'
    f.email { Faker::Internet.free_email }
    # Type_user : 1 has all rights
    f.type_user_id 1
    f.tel '0606060606'
    f.ip_addr { Faker::Internet.ip_v4_address }
  end

  factory :agency, class: Agency do |f|
    f.name { Faker::Address.city }
    f.ip_address '8.8.8.8'
  end

  factory :archive, class: Archive do |f|
    # An archive is an copy of an answer
    # t.integer  "incident_id"
    # t.integer  "sender_id"
    f.content { Faker::Lorem.words(12).join(' ') }
    f.ip_address_sender { Faker::Internet.ip_v4_address }
  end

  factory :category, class: Category do |f|
    f.name { Faker::Lorem.word }
  end

  factory :detentor_type, class: DetentorType do |f|
    f.name { Faker::Lorem.word }
  end

  factory :field_agency, class: FieldAgency do |f|
    f.name { Faker::Lorem.word }
  end

  factory :field_agency_agency, class: FieldAgencyAgency do |f|
    # t.integer "agency_id"
    # t.integer "field_agency_id"
    f.content { Faker::Lorem.word }
  end
  factory :field_seller_seller, class: FieldSellerSeller do |f|
    # t.integer "field_seller_id"
    # t.integer "seller_id"
    f.content { Faker::Lorem.word }
  end

  factory :field_seller, class: FieldSeller do |f|
    f.name { Faker::Lorem.word }
  end

  factory :field_type_user_type_user, class: FieldTypeUserTypeUser do |f|
    # t.integer "type_user_id"
    # t.integer "field_type_user_id"
  end

  factory :field_type_user, class: FieldTypeUser do |f|
    f.name { Faker::Lorem.word }
  end

  factory :field_user, class: FieldUser do |f|
    # t.integer "field_type_user_id"
    # t.integer "user_id"
    f.content { Faker::Lorem.word }
  end

  # factory :file_archive, class: FileArchive do |f|
  # end
  # factory :file_incident, class: FileIncident do |f|
  # end
  # factory :file_procedure, class: FileProcedure do |f|
  # end
  # factory :file_response, class: FileResponse do |f|
  # end
  # factory :file_user, class: FileUser do |f|
  # end

  factory :incident, class: Incident do |f|
    # t.integer  "user_id"
    # t.integer  "tech_id"
    # t.integer  "category_id"
    # t.integer  "sous_category_id"
    # t.integer "incident_state_id_for_tech_id"
    # t.integer "incident_state_id_for_user_id"
    f.title { Faker::Lorem.words(4).join(' ') }
    f.content { Faker::Lorem.words(40).join(' ') }
    f.lvl_urgence_user 10
    f.ip_address '8.8.8.8'
  end

  factory :incidents_state, class: IncidentsState do |f|
    f.name { Faker::Lorem.words(3).join(' ') }
    f.shortcut { Faker::Lorem.word }
    f.user_color 'success'
    f.tech_color 'success'
  end

  factory :invalid_user, class: User do |f|
    f.surname ''
    f.name { Faker::Name.last_name }
    f.pseudo { Faker::Internet.user_name }
    f.password 'password'
    f.email { Faker::Internet.free_email }
    f.type_user_id 23
    f.agency_id 2
    f.tel '0606060606'
    f.ip_addr { Faker::Internet.ip_v4_address }
  end

  factory :material, class: Material do |f|
    # t.integer  "type_material_id"
    # t.integer  "detentor_type_id"
    # t.integer  "detentor_id"
    # t.integer  "seller_id"
    f.detentor_id 1
    f.name { Faker::Lorem.words(3).join(' ') }
  end

  factory :procedure, class: Procedure do |f|
    # t.integer  "category_id"
    # t.integer  "sous_category_id"
    f.name { Faker::Lorem.words(3).join(' ') }
    f.contenu { Faker::Lorem.words(40).join(' ') }
    f.resolution { Faker::Lorem.words(30).join(' ') }
  end

  factory :response, class: Response do |f|
    # t.integer  "incident_id"
    # t.integer  "sender_id"
    f.content { Faker::Lorem.words(10).join(' ') }
    f.ip_address_sender '8.8.8.8'
  end

  factory :right, class: Right do |f|
    f.name { Faker::Lorem.word }
    f.content { Faker::Lorem.words(10).join(' ') }
  end

  factory :seller, class: Seller do |f|
    f.name { Faker::Company.name }
  end

  factory :sous_category, class: SousCategory do |f|
    # t.integer "category_id"
    f.name { Faker::Lorem.word }
    f.lvl_urgence_max 10
  end

  factory :spec_material_material, class: SpecMaterialMaterial do |f|
    # t.integer "spec_material_id"
    # t.integer "material_id"
  end

  factory :spec_material, class: SpecMaterial do |f|
    # t.integer "spec_type_material_id"
    f.spec_value { Faker::Lorem.word }
  end

  factory :spec_type_material, class: SpecTypeMaterial do |f|
    f.name { Faker::Lorem.word }
  end

  factory :type_material_seller, class: TypeMaterialSeller do |f|
    # t.integer "type_material_id"
    # t.integer "seller_id"
  end

  factory :type_material_spec_type_material, class: TypeMaterialSpecTypeMaterial do |f|
    # t.integer "type_material_id"
    # t.integer "spec_type_material_id"
  end

  factory :type_material, class: TypeMaterial do |f|
    f.name { Faker::Lorem.words(2).join(' ') }
  end

  factory :type_user_right, class: TypeUserRight do |f|
    # t.integer "right_id"
    # t.integer "type_user_id"
    f.value true
  end

  factory :type_user, class: TypeUser do |f|
    f.name { Faker::Lorem.word }
    f.secure true
    f.is_tech true
    f.actif true
  end

  factory :update, class: Update do |f|
    f.changesMade { Faker::Lorem.words(5).join(' ') }
  end

  factory :user do |f|
    f.surname { Faker::Name.first_name }
    f.name { Faker::Name.last_name }
    f.pseudo { Faker::Internet.user_name }
    f.password 'password'
    f.email { Faker::Internet.free_email }
    # Type_user : 23 has no rights
    f.type_user_id 23
    f.agency_id 2
    f.tel '0606060606'
    f.ip_addr { Faker::Internet.ip_v4_address }
    f.actif true
  end
end
