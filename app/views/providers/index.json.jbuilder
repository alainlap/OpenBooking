json.array!(@providers) do |provider|
  json.extract! provider, :name, :address, :postal_code, :city, :province, :type_id, :user_id
  json.url provider_url(provider, format: :json)
end
