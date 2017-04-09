class Dashboard < ActiveRecord::Base
  def self.check_in
    CustomerEvent.select("customers.first_name, customers.last_name, events.event_date, events.start_time, events.end_time, events.event_name, customer_events.number_in_party")
        .joins(:customer)
        .joins(:event)
        .where("events.event_date = CURRENT_DATE")
        .where("events.event_type_id <> '7'")
        .order("events.start_time ASC, customers.first_name ASC, customers.last_name ASC")
  end

  def self.event_list
    CustomerEvent.select("events.start_time, events.event_name, event_types.event_type_desc, colors.color_code, sum(number_in_party) AS number_in_party, sum(adults_painting) AS adults_painting, sum(kids_painting) AS kids_painting")
        .joins(event: :color)
        .joins(event: :event_type)
        .where("events.event_date = CURRENT_DATE")
        .where("events.event_type_id <> '7'")
        .order("events.start_time ASC")
        .group("events.start_time, events.event_name, event_types.event_type_desc, colors.color_code")
  end
end