json.extract! event_type, :id, :event_type_desc, :created_at, :updated_at
json.url event_type_url(event_type, format: :json)
