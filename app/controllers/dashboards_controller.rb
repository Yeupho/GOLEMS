class DashboardsController < ApplicationController
  def index
    @check_in = CustomerEvent.find_by_sql("SELECT * FROM customer_events ce JOIN events e ON e.id = ce.event_id WHERE e.event_date = '0006-08-16' ORDER BY e.start_time ASC")
    @event_list = CustomerEvent.find_by_sql("SELECT * FROM customer_events ce JOIN events e ON e.id = ce.event_id WHERE e.event_date = '0006-08-16' ORDER BY e.start_time ASC").uniq
  end
end
