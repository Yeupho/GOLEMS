class CustomersController < ApplicationController
  require 'will_paginate/array'
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.find_by_sql("SELECT * FROM customers c WHERE c.customer_status_id = '1'").paginate(page: params[:page], per_page: 13)
    @customer = Customer.new
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @events = Event.joins(:customers).where("customers.id = ?", params[:id]).order("event_date DESC")
    @not_ready = CustomerEventProduct.joins(:customer_event).joins(customer_event: :customer).where(pickup_status_id: '1').where("customers.id = ?", params[:id])
    @ready = CustomerEventProduct.joins(:customer_event).joins(customer_event: :customer).where(pickup_status_id: '2').where("customers.id = ?", params[:id])
    @collected = CustomerEventProduct.joins(:customer_event).joins(customer_event: :customer).where(pickup_status_id: '3').where("customers.id = ?", params[:id])
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  def search
    @customers = Customer.order(:phone).where("phone like ?", "%#{params[:term]}%")
    render json: @customers.map(&:phone)
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer = Customer.with_deleted.find(params[:id])
    if params[:type]=='normal'
      @customer.delete
    elsif params[:type]=='restore'
      @customer.restore
    end

    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.with_deleted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :phone, :address, :city, :state_id, :zipcode, :country_id, :comment, :customer_status_id)
    end
end
