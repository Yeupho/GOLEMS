class AdminController < ApplicationController
  def index
    @colors = Color.all
    @color = Color.new
    @products = Product.all


  end
end