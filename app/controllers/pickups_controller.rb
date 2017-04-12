class PickupsController < ApplicationController
  def index
    @n_ready = CustomerEventProduct.pickup_progress
    @picked  = CustomerEventProduct.pickup_picked
    @ready = CustomerEventProduct.pickup_ready
  end


  def update
    respond_to do |format|
      if CustomerEventProduct.update(pickups_params)
        format.html { redirect_to '/pickups', notice: 'Customer event product was successfully updated.' }
        format.json { head :no_content}
      else
        format.html { render :edit }
        format.json { render json: @customer_event_product.errors, status: :unprocessable_entity }
      end
    end
  end
  def progress
    CustomerEventProduct.update_all(['pickup_status_id', 2],{id: params[:pickup_status_ids]})
    redirect_to pickups_url
  end

  private
  def set_pickups
    @customer_event_product = CustomerEventProduct.find(params[:id])
  end

  def pickups_params
    params.require(:customer_event_product).permit(:customer_event_id, :product_id, :quantity, :pickup_status_id)
  end
end