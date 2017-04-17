class AdminController < ApplicationController
  require 'will_paginate/array'
  def index
    @colors = Color.all
    @products = Product.all
    @product_types = ProductType.all.paginate(page:params[:product_type_page], per_page:10)
    @event_types = EventType.where('id <> 7').all
    @positions = Position.all
    @employee_types = EmployeeType.all
    @states = State.all
    @countries = Country.all
    @customer_statuses = CustomerStatus.all.paginate(page: params[:customer_status_page],per_page:10)
    @employee_statuses = EmployeeStatus.all.paginate(page: params[:employee_status_page],per_page:10)

    @customers = Customer.all
    @events = Event.all
    @employees = Employee.all
# calls the various new elements for the variables
    @color = Color.new
    @product = Product.new
    @product_type = ProductType.new
    @event_type = EventType.new
    @position = Position.new
    @employee = Employee.new
    @employee_status = EmployeeStatus.new
    @employee_type = EmployeeType.new
    @state = State.new
    @country = Country.new
    @customer_status = CustomerStatus.new

# Used to call the various percentage data
    @weeklysales = Admin.weeklysales
    @twoweeksprior = Admin.twoweeksprior

    @totalvisitors = Admin.totalvisitors
    @twototalvisitors = Admin.twototalvisitors

    @productsold = Admin.productsold
    @twoproductsold = Admin.twoproductsold

    @productsready = Admin.productsready
    @twoproductsready = Admin.twoproductsready

    @mostprofit = Admin.mostprofit
    render stream: true
  end

  def new



  end

  def show
    @CEP = CustomerEventProduct.all
    @CEP1 = CustomerEventProduct.group(:created_at).sum(:quantity)
  end

  def colortab
    render 'colors/colortab'
    def new
      @colors = Color.new
    end
    def index
      @colors = Color.all.paginate(page: params[:color_page], per_page: 10)
    end
    def show

    end
  end
end