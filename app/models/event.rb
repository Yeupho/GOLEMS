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
    Event.select("events.id, events.event_name, events.event_date, events.start_time, events.event_status_id, colors.color_code").joins(:color).where("events.event_type_id <> '7'")
  end

  def self.customer
    CustomerEvent.select("customer_events.id, event_id, customers.first_name, customers.last_name, kids_painting, adults_painting, number_in_party, sum(products.product_price * customer_event_products.quantity) AS sales")
        .joins(:customer)
        .joins(customer_event_products: :product)
        .order("customers.first_name ASC")
        .group("customer_events.id, event_id, customers.first_name, customers.last_name, kids_painting, adults_painting, number_in_party")
  end

  def self.host
    EmployeeEvent.select("employee_events.id, employees.first_name, employees.last_name").joins(:employee).joins(:event)
  end
end
