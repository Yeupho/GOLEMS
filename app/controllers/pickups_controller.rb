class PickupsController < ApplicationController
  require 'will_paginate/array'
  def index
    @n_ready = Pickup.progress.paginate(page: params[:progress_page], per_page: 15)
    @picked  = Pickup.picked.paginate(page: params[:ready_page], per_page: 15)
    @ready = Pickup.ready.paginate(page: params[:picked_up_page], per_page: 15)
  end
end