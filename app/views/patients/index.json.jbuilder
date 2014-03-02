json.array!(@patients) do |patient|
  json.extract! patient, :id, :first_name, :last_name, :number, :diagnosis, :date_of_admission
  json.url patient_url(patient, format: :json)
end
