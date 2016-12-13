json.array!(@spec_type_materials) do |spec_type_material|
  json.extract! spec_type_material, :id, :name
  json.url spec_type_material_url(spec_type_material, format: :json)
end
