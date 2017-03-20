json.array!(@spec_materials) do |spec_material|
  json.extract! spec_material, :id, :spec_type_material_id, :spec_value
  json.url spec_material_url(spec_material, format: :json)
end
