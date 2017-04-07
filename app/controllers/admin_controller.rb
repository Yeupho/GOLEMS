class AdminController < ApplicationController
  require 'will_paginate/array'
  def index
    @colors = Color.all.paginate(page: params[:color_page], per_page: 10)
    @color = Color.new
    @products = Product.all.paginate(page: params[:product_page], per_page: 10)
    @event_types = EventType.all.paginate(page: params[:event_type_page], per_page: 10)
    @positions = Position.all.paginate(page: params[:position_page], per_page: 10)
  end
end