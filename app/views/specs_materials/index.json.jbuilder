json.array!(@specs_materials) do |specs_material|
  json.extract! specs_material, :id, :spec_type_material_id, :spec_value
  json.url specs_material_url(specs_material, format: :json)
end
