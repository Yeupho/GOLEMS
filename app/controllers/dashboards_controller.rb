class DashboardsController < ApplicationController
  before_action :authenticate_user!
  require 'will_paginate/array'

  def index
    @check_in = CustomerEvent.check_in
    @event_list = Event.event_list.paginate(page: params[:event_list_page], per_page: 2)
    @party_size = CustomerEvent.party_size
  end
end

