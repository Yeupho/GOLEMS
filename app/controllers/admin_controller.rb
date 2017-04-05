class AdminController < ApplicationController
  def index
    @colors = Color.all
    @color = Color.new
    @products = Product.all
    @event_types = EventType.all
    @positions = Position.all


  end
end