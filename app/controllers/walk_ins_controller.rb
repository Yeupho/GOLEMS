class WalkInsController < ApplicationController
  def index
    @walk_in = CustomerEvent.walk_in
    @customer_event = CustomerEvent.new
    @find_walk_in = Event.find_walk_in
  end
end
