class ArchiveController < ApplicationController
  before_action :authenticate_user!

  def index
    @customers = Customer.all
    @events = Event.all
    @products = Product.all
    @employees = Employee.all
    @employee_events = EmployeeEvent.all
    @customer_events = CustomerEvent.all
    @customer_event_products = CustomerEventProduct.all
    @colors = Color.all
    @positions = Position.all
    @event_types = EventType.all
    @employee_types = EmployeeType.all
    @product_types=ProductType.all
  end

end
