json.array!(@field_sellers) do |field_seller|
  json.extract! field_seller, :id, :name
  json.url field_seller_url(field_seller, format: :json)
end
