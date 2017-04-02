json.array!(Event.all) do |event|
  json.extract! event, :id
  json.title event.event_name
  json.start event.start_time
  json.end event.end_time
  json.url event_url(event, format: :html)
end
