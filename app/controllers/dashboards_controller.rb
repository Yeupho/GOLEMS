class DashboardsController < ApplicationController
  require 'will_paginate/array'

  def index
    @check_in = Dashboard.check_in
    @event_list = Dashboard.event_list.paginate(page: params[:event_list_page], per_page: 2)
    @dues = Dashboard.dues
  end

  def destroy
    @dues = CustomerEvent.with_deleted.find(params[:id])
    if params[:type]=='normal'
      @dues.delete
    elsif params[:type]=='restore'
      @dues.restore
      @dues.update(deleted_at: nil)
    end
  end
end

