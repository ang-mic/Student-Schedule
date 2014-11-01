json.array!(@students) do |student|
  json.extract! student, :id, :email, :password, :first_name, :last_name, :student_number, :level, :date_of_birth, :telephone_number
  json.url student_url(student, format: :json)
end
