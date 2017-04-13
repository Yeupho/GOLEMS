class Event < ApplicationRecord
  acts_as_paranoid
  validates :event_name, presence: true
  has_many :customer_events
  has_many :customer_event_products, :through => :customer_events
  has_many :products, :through => :customer_event_products
  has_many :customers, :through => :customer_events
  has_many :employee_events
  has_many :employees, :through => :employee_events
  belongs_to :color
  belongs_to :event_type

  def self.calendar
    Event.select("events.id, event_name, event_date || ' ' || start_time AS date, colors.color_code").joins(:color).where("events.event_type_id <> '7'")
  end

  def self.upcoming_assignments
    Event.select("employee_events.event_id, event_name, event_date, start_time, end_time, employees.employee_status_id")
        .joins(employee_events: :employee)
        .where("events.event_date >= ?", Date.today)
        .order("events.event_date ASC")
        .order("events.start_time ASC")
  end

  def self.event_list
    Event.select("events.id, start_time, event_name, event_types.event_type_desc, colors.color_code")
        .joins(:color)
        .joins(:event_type)
        .where("event_type_id <> '7'")
        .where("event_date = ?", Date.today)
        .order("start_time ASC")
  end

  def self.find_walk_in
    Event.select("events.id").where("events.event_date = ?", Date.today).where("events.event_type_id = '7'")
  end
end
