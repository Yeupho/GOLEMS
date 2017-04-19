class CustomerStatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer_status, only: [:show, :edit, :update, :destroy]

  # GET /customer_statuses
  # GET /customer_statuses.json
  def index
    @customer_statuses = CustomerStatus.all
  end

  # GET /customer_statuses/1
  # GET /customer_statuses/1.json
  def show
  end

  # GET /customer_statuses/new
  def new
    @customer_status = CustomerStatus.new
  end

  # GET /customer_statuses/1/edit
  def edit
  end

  # POST /customer_statuses
  # POST /customer_statuses.json
  def create
    @customer_status = CustomerStatus.new(customer_status_params)

    respond_to do |format|
      if @customer_status.save
        format.html { redirect_to '/admin#status_tab', notice: 'Customer Status was successfully created.' }
        format.json { render :show, status: :created, location: @customer_status }
      else
        format.html { render :new }
        format.json { render json: @customer_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_statuses/1
  # PATCH/PUT /customer_statuses/1.json
  def update
    respond_to do |format|
      if @customer_status.update(customer_status_params)
        format.html { redirect_to '/admin#status_tab', notice: 'Customer Status was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_status }
      else
        format.html { render :edit }
        format.json { render json: @customer_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_statuses/1
  # DELETE /customer_statuses/1.json
  def destroy
    @customer_statuses = CustomerStatus.with_deleted.find(params[:id])
    if params[:type]=='normal'
      @customer_status.delete
      respond_to do |format|
        format.html { redirect_to '/admin#status_tab', notice: 'Customer Status was successfully removed.' }
        format.json { head :no_content }
      end
    elsif params[:type]=='restore'
      @customer_status.restore
      @customer_status.update(deleted_at: nil)
      respond_to do |format|
        format.html { redirect_to '/admin#status_tab', notice: 'Customer Status was successfully restored.' }
        format.json { head :no_content }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_status
      @customer_status = CustomerStatus.with_deleted.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_status_params
      params.require(:customer_status).permit(:customer_status_description)
    end
end
