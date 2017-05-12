json.array!(@rights) do |right|
  json.extract! right, :id, :name
  json.url right_url(right, format: :json)
end
