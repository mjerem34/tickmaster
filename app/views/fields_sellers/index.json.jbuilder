json.array!(@fields_sellers) do |fields_seller|
  json.extract! fields_seller, :id, :name
  json.url fields_seller_url(fields_seller, format: :json)
end
