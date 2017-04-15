class EmployeesController < ApplicationController
  require 'will_paginate/array'
  before_action :set_employee, only: [:show, :edit, :update, :destroy]

  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.employees.paginate(page: params[:employee_page], per_page: 13)
    @employee = Employee.new
    @positions = EmployeeType.positions

    @upcoming_count = Event.upcoming_count
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
    @past_assignments = EmployeeEvent.past_assignments.where("employees.id = ?", params[:id])
    @upcoming_assignments = Event.upcoming_assignments.where("employees.id = ?", params[:id])
    @co_host = Employee.co_host.where("employees.id <> ?", params[:id])
    @position = Position.new
    @party_size = CustomerEvent.party_size

    @upcoming_count = Event.upcoming_count.where("employees.id = ?", params[:id])
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end

  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employees = Employee.with_deleted.find(params[:id])
    if params[:type]=='normal'
      @employee.delete
    elsif params[:type]=='restore'
      @employee.restore
      @employee.update(deleted_at: nil)
    end

    respond_to do |format|
      format.html { redirect_to '/employees' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.with_deleted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employee).permit(:first_name, :last_name, :email, :phone, :address, :city, :state_id, :zipcode, :country_id, :comment, :employee_status_id, :archive)
    end
end
