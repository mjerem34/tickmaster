json.array!(@field_agencies) do |_field_agency|
  json.extract! field_agencies, :id, :name
  json.url field_agencies_url(field_agencies, format: :json)
end
