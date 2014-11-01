json.array!(@societies) do |society|
  json.extract! society, :id, :email, :password, :name, :category, :descritpion
  json.url society_url(society, format: :json)
end
