json.array!(@courses) do |course|
  json.extract! course, :id, :title, :short_title, :number_of_levels, :category
  json.url course_url(course, format: :json)
end
