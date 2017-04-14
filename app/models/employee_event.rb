class EmployeeEvent < ApplicationRecord
  acts_as_paranoid
  belongs_to :employee
  belongs_to :event

  def self.past_assignments
    EmployeeEvent.select("employee_events.event_id, events.event_name, events.event_date, events.start_time, events.end_time, sum(customer_events.kids_painting) AS kids_painting, sum(customer_events.adults_painting) AS adults_painting, sum(customer_events.number_in_party) AS number_in_party")
        .joins(:event)
        .joins(:employee)
        .joins(event: :customer_events)
        .where("events.event_date < ?", Date.today)
        .order("events.event_date DESC")
        .order("events.start_time ASC")
        .group("employee_events.event_id, events.event_name, events.event_date, events.start_time, events.end_time")
  end

  def self.host
    EmployeeEvent.select("employee_events.id, employees.first_name, employees.last_name").joins(:employee).joins(:event)
  end
end
