class CustomersController < ApplicationController
  require 'will_paginate/array'
  before_action :set_customer, only: [:show, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customer = Customer.new
    @customers = Customer.customers.search(params[:search]).paginate(page: params[:page], per_page: 9)

    @progress_count = CustomerEventProduct.progress_count
    @ready_count = CustomerEventProduct.ready_count
    @picked_up_count = CustomerEventProduct.picked_up_count
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer_event_product = CustomerEventProduct.new

    @transactions = Event.transactions.where("customers.id = ?", params[:id]).limit(3)
    @total_spending = Event.transactions.where("customers.id = ?", params[:id])
    @transaction_total = Event.transaction_total

    @not_ready = CustomerEventProduct.customer_not_ready.where("customers.id = ?", params[:id])
    @ready = CustomerEventProduct.customer_ready.where("customers.id = ?", params[:id])
    @collected = CustomerEventProduct.customer_collected.where("customers.id = ?", params[:id])

    @progress_count = CustomerEventProduct.progress_count.where("customers.id = ?", params[:id])
    @ready_count = CustomerEventProduct.ready_count.where("customers.id = ?", params[:id])
    @picked_up_count = CustomerEventProduct.picked_up_count.where("customers.id = ?", params[:id])
  end

  def search
    @customers = Customer.order(:phone).where("phone like ?", "%#{params[:term]}%")
    render json: @customers.map(&:phone)
  end

  def all_transactions
    @all_transactions = Event.transactions
    @transaction_total = Event.transaction_total
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
        format.html { render :index }
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
        format.html { render :show }
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
      @customer.update(deleted_at: nil)
    end

    respond_to do |format|
      format.html { redirect_to '/admin#activity_tab',notice: 'Customer was successfully restored.' }
      format.json { head :no_content }
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def delete_index
    @customer = Customer.with_deleted.find(params[:id])
    if params[:type]=='normal'
      @customer.delete
    elsif params[:type]=='restore'
      @customer.restore
      @customer.update(deleted_at: nil)
    end

    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_path, notice: 'Customer was successfully deleted.' }
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
