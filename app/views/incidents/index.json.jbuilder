json.array!(@incidents) do |incident|
  json.extract! incident, :id, :content, :user_id, :tech_id, :category_id, :date_ouverture, :date_maj, :date_cloture
  json.url incident_url(incident, format: :json)
end
