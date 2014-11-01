json.array!(@labs) do |lab|
  json.extract! lab, :id, :group
  json.url lab_url(lab, format: :json)
end
