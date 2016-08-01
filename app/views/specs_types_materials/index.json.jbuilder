json.array!(@specs_types_materials) do |specs_types_material|
  json.extract! specs_types_material, :id, :name
  json.url specs_types_material_url(specs_types_material, format: :json)
end
