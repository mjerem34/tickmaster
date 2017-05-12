json.array!(@updates) do |update|
  json.extract! update, :id, :changesMade
  json.url update_url(update, format: :json)
end
