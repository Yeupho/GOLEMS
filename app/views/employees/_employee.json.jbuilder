json.extract! employee, :id, :first_name, :last_name, :email, :phone, :address, :city, :state_id, :zipcode, :country_id, :comment, :employee_status_id, :archive, :created_at, :updated_at
json.url employee_url(employee, format: :json)
