json.extract! event, :id, :event_name, :event_date, :start_time, :end_time, :event_type_id, :color_id, :event_status_id, :event_description, :created_at, :updated_at
json.url event_url(event, format: :json)
