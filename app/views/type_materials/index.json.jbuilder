json.array!(@type_materials) do |type_material|
  json.extract! type_material, :id, :name
  json.url type_material_url(type_material, format: :json)
end
