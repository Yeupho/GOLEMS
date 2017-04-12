class Event < ApplicationRecord
  after_initialize :set_defaults
  acts_as_paranoid
  validates :event_name, presence: true
  has_many :customer_events
  has_many :customer_event_products, :through => :customer_events
  has_many :products, :through => :customer_event_products
  has_many :customers, :through => :customer_events
  has_many :employee_events
  has_many :employees, :through => :employee_events
  belongs_to :color
  belongs_to :event_status
  belongs_to :event_type

  def set_defaults
    self.event_status_id ||= 1
  end

  def self.calendar
    Event.select("events.id, event_name, event_date || ' ' || start_time AS date, event_status_id, colors.color_code").joins(:color).where("event_type_id <> '7'")
  end

  def self.upcoming_assignments
    Event.select("employee_events.event_id, event_name, event_date, start_time, end_time, event_status_id")
        .joins(employee_events: :employee)
        .where("event_date >= ?", Date.today)
        .order("event_date ASC")
        .order("start_time ASC")
  end

  def self.event_list
    Event.select("events.id, start_time, event_name, event_types.event_type_desc, colors.color_code, event_status_id")
        .joins(:color)
        .joins(:event_type)
        .where("event_type_id <> '7'")
        .where("event_date = ?", Date.today)
        .order("start_time ASC")
  end

  def self.find_walk_in
    Event.select("events.id, event_status_id").where("event_date = ?", Date.today).where("event_type_id = '7'")
  end

  def self.upcoming_count
    Event.joins(employee_events: :employee).where("event_date >= ?", Date.today)
  end
end
