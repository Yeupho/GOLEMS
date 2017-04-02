class AdminController < ApplicationController
  def index
    @colors = Color.all


  end
end