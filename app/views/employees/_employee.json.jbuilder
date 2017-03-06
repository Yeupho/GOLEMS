json.extract! employee, :id, :first_name, :last_name, :email, :phone, :address, :city, :state_id, :zipcode, :comments, :payrate, :employee_status_id, :employee_type, :created_at, :updated_at
json.url employee_url(employee, format: :json)
