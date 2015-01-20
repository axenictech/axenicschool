json.array!(@qusetion_types) do |qusetion_type|
  json.extract! qusetion_type, :id, :type
  json.url qusetion_type_url(qusetion_type, format: :json)
end
