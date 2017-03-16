json.extract! customer_event_product, :id, :customer_event_id, :product_id, :quantity, :pickup_status_id, :archive, :created_at, :updated_at
json.url customer_event_product_url(customer_event_product, format: :json)
