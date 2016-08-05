json.array!(@updates) do |update|
  json.extract! update, :id, :changes
  json.url update_url(update, format: :json)
end
