class DashboardsController < ApplicationController
  def index
    @check_in = Dashboard.check_in
    @event_list = Dashboard.event_list
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
