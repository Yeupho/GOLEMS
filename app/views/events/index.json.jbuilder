json.array!(@calendar) do |event|
  json.id event.id
  json.title event.event_name
  json.start event.date
  json.color event.color_code
  json.textColor '#2b2b2b'
  json.url event_url(event, event_history: events_path, format: :html)
end
