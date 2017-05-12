json.array!(@sellers) do |seller|
  json.extract! seller, :id
  json.url seller_url(seller, format: :json)
end
