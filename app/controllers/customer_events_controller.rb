class CustomerEventsController < ApplicationController
  before_action :set_customer_event, only: [:show, :edit, :update, :destroy]

  # GET /customer_events/1
  # GET /customer_events/1.json
  def show
    @customer_event_products = CustomerEventProduct.customer_event_products.where("customer_event_id = ?", params[:id])
    @customer_event_product = CustomerEventProduct.new
  end

  # GET /customer_events/new
  def new
    @customer_event = CustomerEvent.new
  end

  # GET /customer_events/1/edit
  def edit
  end

  # POST /customer_events
  # POST /customer_events.json
  def create
    @customer_event = CustomerEvent.new(customer_event_params)

    respond_to do |format|
      if @customer_event.save
        format.html { redirect_to :back, notice: 'Customer was successfully created.', method: :get}
        format.js
      else
        format.html { render :new }
        format.json { render json: @customer_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_events/1
  # PATCH/PUT /customer_events/1.json
  def update
    respond_to do |format|
      if @customer_event.update(customer_event_params)
        format.html { redirect_to @customer_event, notice: 'Customer was successfully updated.', method: :get }
        format.json { render :show, status: :ok, location: @customer_event }
      else
        format.html { render :edit }
        format.json { render json: @customer_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_events/1
  # DELETE /customer_events/1.json
  def destroy
    @customer_events = CustomerEvent.with_deleted.find(params[:id])
    if params[:type]=='normal'
      @customer_event.delete
    elsif params[:type]=='restore'
      @customer_event.restore
      @customer_event.update(deleted_at: nil)
    end

    @customer_event.destroy
    respond_to do |format|
      format.html { redirect_to customer_events_url, notice: 'Customer event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_event
      @customer_event = CustomerEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_event_params
      params.require(:customer_event).permit(:event_id, :customer_id, :number_in_party, :adults_painting, :kids_painting)
    end
end
