class DashboardsController < ApplicationController
  def index
    @check_in = Dashboard.check_in
    @event_list = Dashboard.event_list
    @dues = Dashboard.dues
  end
end
