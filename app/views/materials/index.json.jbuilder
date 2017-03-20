json.array!(@materials) do |material|
  json.extract! material, :id, :type_material_id, :detentor_type_id, :detentor_id, :seller_id, :date
  json.url material_url(material, format: :json)
end
