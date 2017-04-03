json.array!(@calendar) do |event|
  json.id event.id
  json.title event.event_name
  json.start event.event_date
  json.url event_url(event, format: :html)
end
