class PickupsController < ApplicationController
  def index
    @n_ready = CustomerEventProduct.pickup_progress
    @picked  = CustomerEventProduct.pickup_picked
    @ready = CustomerEventProduct.pickup_ready

    @progress_count = CustomerEventProduct.progress_count
    @ready_count = CustomerEventProduct.ready_count.where("events.event_date > ?", (Date.today - 6.month))
    @picked_up_count = CustomerEventProduct.picked_up_count
  end
end
