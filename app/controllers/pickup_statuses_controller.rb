class PickupStatusesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pickup_status, only: [:show, :edit, :update, :destroy]

  # GET /pickup_statuses
  # GET /pickup_statuses.json
  def index
    @pickup_statuses = PickupStatus.all
  end

  # GET /pickup_statuses/1
  # GET /pickup_statuses/1.json
  def show
  end

  # GET /pickup_statuses/new
  def new
    @pickup_status = PickupStatus.new
  end

  # GET /pickup_statuses/1/edit
  def edit
  end

  # POST /pickup_statuses
  # POST /pickup_statuses.json
  def create
    @pickup_status = PickupStatus.new(pickup_status_params)

    respond_to do |format|
      if @pickup_status.save
        format.html { redirect_to @pickup_status, notice: 'Pickup status was successfully created.' }
        format.json { render :show, status: :created, location: @pickup_status }
      else
        format.html { render :new }
        format.json { render json: @pickup_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pickup_statuses/1
  # PATCH/PUT /pickup_statuses/1.json
  def update
    respond_to do |format|
      if @pickup_status.update(pickup_status_params)
        format.html { redirect_to @pickup_status, notice: 'Pickup status was successfully updated.' }
        format.json { render :show, status: :ok, location: @pickup_status }
      else
        format.html { render :edit }
        format.json { render json: @pickup_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pickup_statuses/1
  # DELETE /pickup_statuses/1.json
  def destroy
    @pickup_status.destroy
    respond_to do |format|
      format.html { redirect_to pickup_statuses_url, notice: 'Pickup status was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pickup_status
      @pickup_status = PickupStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pickup_status_params
      params.require(:pickup_status).permit(:pickup_status_desc)
    end
end
