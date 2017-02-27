json.array!(@field_type_users) do |field_type_user|
  json.extract! field_type_users, :id, :name, :created_at, :updated_at
  json.url field_type_users_url(field_type_user, format: :json)
end
