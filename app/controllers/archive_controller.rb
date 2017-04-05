class ArchiveController < ApplicationController
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
  end

end
