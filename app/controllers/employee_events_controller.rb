class EmployeeEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_employee_event, only: [:show, :edit, :update, :destroy]

  # GET /employee_events
  # GET /employee_events.json
  def index
    @employee_events = EmployeeEvent.all
  end

  # GET /employee_events/1
  # GET /employee_events/1.json
  def show
  end

  # GET /employee_events/new
  def new
    @employee_event = EmployeeEvent.new
  end

  # GET /employee_events/1/edit
  def edit
  end

  # POST /employee_events
  # POST /employee_events.json
  def create
    @employee_event = EmployeeEvent.new(employee_event_params)

    respond_to do |format|
      if @employee_event.save
        format.html { redirect_to :back, notice: 'Employee was successfully added.' }
      else
        format.html { render :new }
        format.json { render json: @employee_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employee_events/1
  # PATCH/PUT /employee_events/1.json
  def update
    respond_to do |format|
      if @employee_event.update(employee_event_params)
        format.html { redirect_to @employee_event, notice: 'Employee event was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee_event }
      else
        format.html { render :edit }
        format.json { render json: @employee_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employee_events/1
  # DELETE /employee_events/1.json
  def destroy
    @employee_events = EmployeeEvent.with_deleted.find(params[:id])
    if params[:type]=='normal'
      @employee_event.delete
    elsif params[:type]=='restore'
      @employee_event.restore
      @employee_event.update(deleted_at: nil)
    end

    @employee_event.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Host was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee_event
      @employee_event = EmployeeEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_event_params
      params.require(:employee_event).permit(:employee_id, :event_id)
    end
end
