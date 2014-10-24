json.array!(@insurance_providers) do |insurance_provider|
  json.extract! insurance_provider, 
  json.url insurance_provider_url(insurance_provider, format: :json)
end
