json.array!(@detentor_types) do |detentor_type|
  json.extract! detentor_type, :id, :name
  json.url detentor_type_url(detentor_type, format: :json)
end
