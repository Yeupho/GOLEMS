# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "csv"

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

# Customer Event Product
File.open("#{Rails.root}/db/datafiles/CEP.csv") do |customer_event_products|
  customer_event_products.read.each_line do |customer_event_product|
    customer_event_id, product_id, quantity, pickup_status_id, archive= customer_event_product.chomp.split(",")
    CustomerEventProduct.create!(:customer_event_id=>customer_event_id, :product_id=>product_id, :quantity=>quantity,
                                 :pickup_status_id=>pickup_status_id, :archive=>archive )
  end
end


