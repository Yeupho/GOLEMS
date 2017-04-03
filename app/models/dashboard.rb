class Dashboard < ActiveRecord::Base
  def self.check_in
    CustomerEvent.joins(:customer).joins(:event).where("events.event_date = '2017-01-10'").order("events.start_time ASC")
  end

  def self.dues
    CustomerEvent.joins(:customer).joins(:event).where("events.event_date = '2017-01-10'").order("events.start_time ASC")
  end

  def self.event_list
    CustomerEvent.select("events.start_time, events.event_name, event_types.event_type_desc, colors.color_code, sum(number_in_party) AS number_in_party, sum(adults_painting) AS adults_painting, sum(kids_painting) AS kids_painting")
        .joins(:event)
        .joins(event: :color)
        .joins(event: :event_type)
        .where("events.event_date = '2017-01-10'")
        .order("events.start_time ASC")
        .group("events.start_time")
        .group("events.event_name")
        .group("event_types.event_type_desc")
        .group("colors.color_code")
  end
end