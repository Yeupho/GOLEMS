class PickupsController < ApplicationController
  def index
    @n_ready = CustomerEvent.progress
    @picked  = CustomerEvent.picked
    @ready = CustomerEvent.ready
  end
end