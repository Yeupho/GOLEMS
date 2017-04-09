class Event < ApplicationRecord
  after_initialize :set_defaults
  acts_as_paranoid
  validates :event_name, presence: true
  has_many :customer_events
  has_many :customers, :through => :customer_events
  has_many :employee_events
  has_many :employees, :through => :employee_events
  belongs_to :color
  belongs_to :event_status
  belongs_to :event_type

  def set_defaults
    self.event_status_id ||= 1
  end

  def self.event_total
    Event.select("events.event_status_id, sum(products.product_price * customer_event_products.quantity) AS sales")
        .joins(customer_events: {customer_event_products: :product}).group("events.event_status_id")
  end

  def self.host
    EmployeeEvent.select("employees.first_name, employees.last_name").joins(:employee).joins(:event)
  end
end
