json.array!(@clients) do |client|
  json.extract! client, :name, :address, :postal_code, :city, :province, :email, :user_id
  json.url client_url(client, format: :json)
end
