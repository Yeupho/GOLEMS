json.extract! event, :id, :event_description, :event_date, :start_time, :end_time, :event_type_id, :color_id, :event_status_id, :grand_total, :created_at, :updated_at
json.url event_url(event, format: :json)
