json.extract! customer_event, :id, :event_id, :customer_id, :number_in_party, :adults_painting, :kids_painting, :deposit, :archive, :created_at, :updated_at
json.url customer_event_url(customer_event, format: :json)
