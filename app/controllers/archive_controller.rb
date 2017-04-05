class ArchiveController < ApplicationController
  def index
    @customers = Customer.all
    @events = Event.all
    @product = Product.all
    @employees = Employee.all
    @employee_events = EmployeeEvent.all
    @customer_events = CustomerEvent.all
    @customer_event_products = CustomerEventProduct.all
    @colors = Color.all
    @EmpDayReport = Employee.all
  end

end
