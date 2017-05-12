json.array!(@procedures) do |procedure|
  json.extract! procedure, :id, :nom, :contenu, :resolution, :category_id, :sous_category_id
  json.url procedure_url(procedure, format: :json)
end
