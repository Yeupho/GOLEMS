json.extract! event_status, :id, :event_status_desc, :created_at, :updated_at
json.url event_status_url(event_status, format: :json)
