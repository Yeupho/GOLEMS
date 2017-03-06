json.extract! customer, :id, :first_name, :lastname, :email, :phone, :address, :city, :state_id, :zipcode, :comments, :customer_status_id, :created_at, :updated_at
json.url customer_url(customer, format: :json)
