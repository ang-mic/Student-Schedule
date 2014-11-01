json.array!(@timetables) do |timetable|
  json.extract! timetable, :id, :level, :term, :start_at, :end_at, :academic_year, :references
  json.url timetable_url(timetable, format: :json)
end
