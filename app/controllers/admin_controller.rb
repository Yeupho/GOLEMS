class AdminController < ApplicationController
  require 'will_paginate/array'
  def index
    @colors = Color.all.paginate(page: params[:color_page], per_page: 11)
    @color = Color.new
    @products = Product.all.paginate(page: params[:product_page], per_page: 11)
    @event_types = EventType.all.paginate(page: params[:event_type_page], per_page: 11)
    @positions = Position.all.paginate(page: params[:position_page], per_page: 7)
    @prod = Product.all
    @states = State.all.paginate(page: params[:state_page], per_page:10)
    @employee_types = EmployeeType.all.paginate(page: params[:employee_type_page],per_page: 11)
    @countries = Country.all.paginate(page: params[:country_page], per_page:10)
    @product_types = ProductType.all.paginate(page:params[:product_type_page], per_page:11)

  end

  def show
    @CEP = CustomerEventProduct.all
    @CEP1 = CustomerEventProduct.group(:created_at).sum(:quantity)
  end
end