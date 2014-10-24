json.array!(@appointments) do |appointment|
  json.extract! appointment, :client_id, :occured_on, :start, :end, :copay_received
  json.url appointment_url(appointment, format: :json)
end
