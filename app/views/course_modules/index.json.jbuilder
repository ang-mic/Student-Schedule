json.array!(@course_modules) do |course_module|
  json.extract! course_module, :id, :title, :code, :lecturer
  json.url course_module_url(course_module, format: :json)
end
