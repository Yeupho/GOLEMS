class AdminController < ApplicationController
  require 'will_paginate/array'
  def index
    @colors = Color.all.paginate(page: params[:color_page], per_page: 11)
    @color = Color.new
    @products = Product.all.paginate(page: params[:product_page], per_page: 11)
    @event_types = EventType.all.paginate(page: params[:event_type_page], per_page: 11)
    @positions = Position.all.paginate(page: params[:position_page], per_page: 11)
  end
end