class AdminController < ApplicationController
  def index
    @colors = Color.all
    @color = Color.new


  end
end