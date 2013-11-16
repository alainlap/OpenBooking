json.array!(@appointments) do |appointment|
  json.extract! appointment, :start_datetime, :end_datetime, :reason, :description, :provider_id, :client_id
  json.url appointment_url(appointment, format: :json)
end
