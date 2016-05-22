json.array!(@groups) do |group|
  json.extract! group, :id, :name, :year, :subject_id
  json.url group_url(group, format: :json)
end
