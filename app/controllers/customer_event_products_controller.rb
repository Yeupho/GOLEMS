class CustomerEventProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer_event_product, only: [:show, :edit, :update, :destroy, :ready_tab_update, :progress_tab_update, :picked_tab_update]

  # GET /customer_event_products
  # GET /customer_event_products.json
  def index
    @customer_event_products = CustomerEventProduct.all
    @customer_event_product = CustomerEventProduct.new
  end

  # GET /customer_event_products/1
  # GET /customer_event_products/1.json
  def show
  end

  # GET /customer_event_products/new
  def new
    @customer_event_product = CustomerEventProduct.new
  end

  # GET /customer_event_products/1/edit
  def edit
  end

  # POST /customer_event_products
  # POST /customer_event_products.json
  def create
    @customer_event_product = CustomerEventProduct.new(customer_event_product_params)

    respond_to do |format|
      if @customer_event_product.save
        format.html { redirect_to :back, notice: 'Product was successfully added.', method: :get }
        format.js
      else
        format.html { render :new }
        format.json { render json: @customer_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_event_products/1
  # PATCH/PUT /customer_event_products/1.json
  def update
    respond_to do |format|
      if @customer_event_product.update(customer_event_product_params)
        format.html { redirect_to :back, notice: 'Piece was successfully updated.' }
        format.json { head :no_content}
      else
        format.html { render :edit }
        format.json { render json: @customer_event_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_event_products/1
  # PATCH/PUT /customer_event_products/1.json
  def ready_tab_update
    respond_to do |format|
      if @customer_event_product.update(customer_event_product_params)
        format.html { redirect_to '/pickups#ready', notice: 'Piece was successfully updated.' }
        format.json { head :no_content}
      else
        format.html { render :back }
        format.json { render json: @customer_event_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_event_products/1
  # PATCH/PUT /customer_event_products/1.json
  def progress_tab_update
    respond_to do |format|
      if @customer_event_product.update(customer_event_product_params)
        format.html { redirect_to '/pickups#progress', notice: 'Piece was successfully updated.' }
        format.json { head :no_content}
      else
        format.html { render :back }
        format.json { render json: @customer_event_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_event_products/1
  # PATCH/PUT /customer_event_products/1.json
  def picked_tab_update
    respond_to do |format|
      if @customer_event_product.update(customer_event_product_params)
        format.html { redirect_to '/pickups#picked_up', notice: 'Piece was successfully updated.' }
        format.json { head :no_content}
      else
        format.html { render :back }
        format.json { render json: @customer_event_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_event_products/1
  # DELETE /customer_event_products/1.json
  def destroy
    title = @customer_event_product.product.product_name

    if @customer_event_product.destroy
      flash[:notice] = "#{title} was removed successfully."
      redirect_to :back
    else
      flash[:error] = "There was an error removing the item"
      render :show
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_customer_event_product
    @customer_event_product = CustomerEventProduct.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def customer_event_product_params
    params.require(:customer_event_product).permit(:customer_event_id, :product_id, :quantity, :pickup_status_id)
  end
end
