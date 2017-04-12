json.array!(@walk_in) do |customer_event|
  json.id customer_event.customer_id
  json.title customer_event.name
  json.start customer_event.event_date
  json.url customer_event_url(customer_event, format: :html)
end
