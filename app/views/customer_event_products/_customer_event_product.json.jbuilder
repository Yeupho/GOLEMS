json.extract! customer_event_product, :id, :customer_event_id, :product_id, :quantity, :product_total, :pickup_status_id, :created_at, :updated_at
json.url customer_event_product_url(customer_event_product, format: :json)
