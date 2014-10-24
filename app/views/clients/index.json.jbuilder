json.array!(@clients) do |client|
  json.extract! client, :first_name, :last_name, :copay, :effective_on
  json.url client_url(client, format: :json)
end
