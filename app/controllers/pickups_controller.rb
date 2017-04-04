class PickupsController < ApplicationController
  def index
    @n_ready = Pickup.progress
    @picked  = Pickup.picked
    @ready = Pickup.ready
  end
end