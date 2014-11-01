json.array!(@university_events) do |university_event|
  json.extract! university_event, :id, :day, :references
  json.url university_event_url(university_event, format: :json)
end
