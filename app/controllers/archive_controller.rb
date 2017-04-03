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
    @EmpDayReport = Employee.find_by_sql('select pv.id, pv.product_name from products pv
                                          left join customer_event_products cep on pv.id = cep.product_id
                                          where quantity is null
                                          order by pv.id')

  end

end
