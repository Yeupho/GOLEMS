# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"
# ===================================================================================
# =================== REKT ALL TABLES ===============================================
# ===================================================================================
State.destroy_all
Customer.destroy_all
CustomerStatus.destroy_all
CustomerEvent.destroy_all
CustomerEventProduct.destroy_all
Product.destroy_all
ProductType.destroy_all
PickupStatus.destroy_all
Employee.destroy_all
EmployeeEvent.destroy_all
EmployeeStatus.destroy_all
EmployeeType.destroy_all
Event.destroy_all
EventType.destroy_all
EventStatus.destroy_all
Color.destroy_all
Country.destroy_all
Position.destroy_all

# ===================================================================================
# ================== Look Up Tables (First) =========================================
# ===================================================================================

# Employee Type
File.open("#{Rails.root}/db/datafiles/EmpType.csv") do |employee_types|
  employee_types.read.each_line do |employee_type|
    employee_type_desc = employee_type.chomp.split(",")
    EmployeeType.create!(:employee_type_desc=>employee_type_desc)
  end
end

# Event Type
File.open("#{Rails.root}/db/datafiles/EventType.csv") do |event_types|
  event_types.read.each_line do |event_type|
    event_type_desc = event_type.chomp.split(",")
    EventType.create!(:event_type_desc=>event_type_desc)
  end
end

# Pickup Status
  PickupStatus.create([{ pickup_status_desc: 'Not Ready' }, { pickup_status_desc: 'In Kiln' },
                      { pickup_status_desc: 'Ready for Pickup' }])
# Product Types
  ProductType.create([{ product_type_desc: 'Bisque' }, { product_type_desc: 'Glass' }])

# Customer Status && Employee Status && Event Status
StatusList = ['Active', 'Inactive']
StatusList.each do |name|
  CustomerStatus.create!(customer_status_description:name)
  EmployeeStatus.create!(employee_status_desc:name)
  EventStatus.create!(event_status_desc:name)
end

 State
 File.open("#{Rails.root}/db/datafiles/State.csv") do |states|
   states.read.each_line do |state|
    state_name, state_abbrev = state.chomp.split(",")
     State.create!(:state_name=>state_name, :state_abbrev=>state_abbrev)
 end
end

# Country Also needs to be added onto ERD | Luke, Mar 3, 2017
# File.open("#{Rails.root}/db/datafiles/Country.csv") do |countries|
#   countries.read.each_line do |country|
#     country_name, country_abbrev = country.chomp.split(",")
#     Country.create!(:country_name=>country_name, :country_abbrev=>country_abbrev)
#   end
# end

# # Color
# File.open("#{Rails.root}/db/datafiles/Color.csv") do |colors|
#   colors.read.each_line do |color|
#     color_code, color_name = color.chomp.split(",")
#     Color.create!(:color_code=>color_code, :color_name=>color_name)
#   end
# end
# ===================================================================================
# ================ Non-associative Tables (Comes Second) ============================
# ===================================================================================

#Employee
File.open("#{Rails.root}/db/datafiles/Emp.csv") do |employees|
  employees.read.each_line do |employee|
    first_name, last_name, email, phone, address, city, state_id, zipcode, country_id,
        comment, employee_status_id= employee.chomp.split(",")
    Employee.create!(:first_name=>first_name, :last_name=>last_name, :email=>email, :phone=>phone, :address=>address,
                      :city=> city, :state_id=>state_id, :zipcode=>zipcode, :country_id=>country_id,
                      :comment=>comment, :employee_status_id=>employee_status_id)
  end
end

# Customer


# Event
# File.open("#{Rails.root}/db/datafiles/Event.csv") do |events|
#   events.read.each_line do |event|
#     event_name, event_date, start_time, end_time, event_type_id, color_id,
#         event_status_id, event_description = event.chomp.split(",")
#     Employee.create!(:event_name=>event_name, :event_date=>event_date, :start_time=>start_time, :end_time=>end_time,
#                     :event_type_id=>event_type_id, :color_id=>color_id, :event_status_id=>event_status_id,
#                     :event_description=>event_description)
#   end
# end

# Product
File.open("#{Rails.root}/db/datafiles/Product.csv") do |products|
  products.read.each_line do |product|
    product_name, product_price, product_type_id= product.chomp.split(",")
    Product.create!(:product_name=>product_name, :product_price=>product_price,
                    :product_type_id=>product_type_id)
  end
end

# ===================================================================================
# =================== ASSOCIATIVE TABLES (Comes Last) ===============================
# ===================================================================================

# Employee Positions
File.open("#{Rails.root}/db/datafiles/Position.csv") do |positions|
  positions.read.each_line do |position|
    employee_id, employee_type_id = position.chomp.split(",")
    Position.create!(:employee_id=>employee_id, :employee_type_id=>employee_type_id)
  end
end

# Employee Event

# Customer Event

# Customer Event Product | Josh will revamp this one.
File.open("#{Rails.root}/db/datafiles/CEP.csv") do |customer_event_products|
  customer_event_products.read.each_line do |customer_event_product|
    customer_event_id, product_id, quantity, pickup_status_id, archive= customer_event_product.chomp.split(",")
    CustomerEventProduct.create!(:customer_event_id=>customer_event_id, :product_id=>product_id, :quantity=>quantity,
                                 :pickup_status_id=>pickup_status_id, :archive=>archive )
  end
end

