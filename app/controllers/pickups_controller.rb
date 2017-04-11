class PickupsController < ApplicationController
  def index
    @n_ready = CustomerEventProduct.pickup_progress
    @picked  = CustomerEventProduct.pickup_picked
    @ready = CustomerEventProduct.pickup_ready
  end
end