json.array!(@sous_categories) do |sous_category|
  json.extract! sous_category, :id
  json.url sous_category_url(sous_category, format: :json)
end
