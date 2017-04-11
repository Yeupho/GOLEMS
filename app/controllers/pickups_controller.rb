class PickupsController < ApplicationController
  require 'will_paginate/array'
  def index
    @n_ready = Pickup.progress.paginate(page: params[:progress_page], per_page: 14)
    @picked  = Pickup.picked.paginate(page: params[:ready_page], per_page: 14)
    @ready = Pickup.ready.paginate(page: params[:picked_up_page], per_page: 14)
  end

  def progress
    Pickup.progress.update_all({progress: true },{id: params[:pickup_status_id]})
  end
end