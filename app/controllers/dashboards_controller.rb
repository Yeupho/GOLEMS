class DashboardsController < ApplicationController
  require 'will_paginate/array'

  def index
    @check_in = Dashboard.check_in
    @event_list = Dashboard.event_list.paginate(page: params[:event_list_page], per_page: 2)
  end
end

