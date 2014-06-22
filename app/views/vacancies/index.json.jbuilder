json.array!(@vacancies) do |vacancy|
  json.extract! vacancy, :id, :name, :validity, :salary
  json.url vacancy_url(vacancy, format: :json)
end
