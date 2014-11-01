json.array!(@webmasters) do |webmaster|
  json.extract! webmaster, :id, :username, :password, :first_name, :last_name
  json.url webmaster_url(webmaster, format: :json)
end
