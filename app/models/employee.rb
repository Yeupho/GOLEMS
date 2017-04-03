class Employee < ApplicationRecord
  after_initialize :set_defaults
  acts_as_paranoid
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true
  has_many :employee_events
  has_many :positions
  has_many :employee_types, :through => :positions
  has_many :events, :through => :employee_events
  belongs_to :employee_status
  belongs_to :state
  belongs_to :country

  def set_defaults
    self.employee_status_id ||= 1
  end

  def self.host
    EmployeeEvent.select("events.event_name, events.event_date, events.start_time, events.end_time, sum(kids_painting) AS kids_painting, sum(number_in_party) AS number_in_party")
        .joins(:event)
        .joins(:employee)
        .joins(event: :customer_events)
        .order("events.event_date DESC")
        .order("events.start_time ASC")
        .group("events.event_name")
        .group("events.event_date")
        .group("events.start_time")
        .group("events.end_time")
  end
end
