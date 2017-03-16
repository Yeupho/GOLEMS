json.extract! customer, :id, :first_name, :last_name, :email, :phone, :address, :city, :state_id, :zipcode, :country_id, :comment, :customer_status_id, :archive, :created_at, :updated_at
json.url customer_url(customer, format: :json)
