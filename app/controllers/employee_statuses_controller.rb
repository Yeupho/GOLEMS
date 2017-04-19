class EmployeeStatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee_status, only: [:show, :edit, :update, :destroy]

  # GET /employee_statuses
  # GET /employee_statuses.json
  def index
    @employee_statuses = EmployeeStatus.all
  end

  # GET /employee_statuses/1
  # GET /employee_statuses/1.json
  def show
  end

  # GET /employee_statuses/new
  def new
    @employee_status = EmployeeStatus.new
  end

  # GET /employee_statuses/1/edit
  def edit
  end

  # POST /employee_statuses
  # POST /employee_statuses.json
  def create
    @employee_status = EmployeeStatus.new(employee_status_params)

    respond_to do |format|
      if @employee_status.save
        format.html { redirect_to @employee_status, notice: 'Employee status was successfully created.' }
        format.json { render :show, status: :created, location: @employee_status }
      else
        format.html { render :new }
        format.json { render json: @employee_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_statuses/1
  # PATCH/PUT /employee_statuses/1.json
  def update
    respond_to do |format|
      if @employee_status.update(employee_status_params)
        format.html { redirect_to '/admin#status_tab', notice: 'Employee status was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_status }
      else
        format.html { render :edit }
        format.json { render json: @employee_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_statuses/1
  # DELETE /employee_statuses/1.json
  def destroy
    @employee_statuses = EmployeeStatus.with_deleted.find(params[:id])
    if params[:type]=='normal'
      @employee_status.delete
      respond_to do |format|
        format.html { redirect_to '/admin#status_tab', notice: 'Employee status was successfully removed.' }
        format.json { head :no_content }
      end
    elsif params[:type]=='restore'
      @employee_status.restore
      @employee_status.update(deleted_at: nil)
      respond_to do |format|
        format.html { redirect_to '/admin#status_tab', notice: 'Employee status was successfully restored.' }
        format.json { head :no_content }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_status
      @employee_status = EmployeeStatus.with_deleted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_status_params
      params.require(:employee_status).permit(:employee_status_desc)
    end
end
