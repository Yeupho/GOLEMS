json.extract! employee_event, :id, :employee_id, :event_id, :archive, :created_at, :updated_at
json.url employee_event_url(employee_event, format: :json)
