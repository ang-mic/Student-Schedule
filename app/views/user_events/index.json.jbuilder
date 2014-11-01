json.array!(@user_events) do |user_event|
  json.extract! user_event, :id, :title, :date, :start_at, :end_at, :repeat_type, :repeat_frequency, :colour, :privacy, :description
  json.url user_event_url(user_event, format: :json)
end
