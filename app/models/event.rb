class Event < ApplicationRecord
  acts_as_paranoid
  validates :event_name, presence: true
  has_many :customer_events
  has_many :customer_event_products, :through => :customer_events
  has_many :products, :through => :customer_event_products
  has_many :customers, :through => :customer_events
  has_many :employee_events
  has_many :employees, :through => :employee_events
  belongs_to :color,-> { with_deleted }
  belongs_to :event_type,-> { with_deleted }

  def self.studiofee
    Event.select(())
  end

  def self.calendar
    Event.select("events.id, event_name, event_date || ' ' || start_time AS date, colors.color_code")
        .joins(:color).where("events.event_type_id <> '7'")
  end

  def self.upcoming_assignments
    Event.select("employee_events.event_id, event_name, event_date, start_time, end_time, employees.employee_status_id")
        .joins(employee_events: :employee)
        .where("event_date >= ?", Date.today)
        .order("event_date ASC")
        .order("start_time ASC")
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
  
  def self.upcoming_count
    Event.joins(employee_events: :employee).where("event_date >= ?", Date.today)
  end

  def self.transactions
    Event.select("customer_events.id, event_name, colors.color_code, event_date, kids_painting, adults_painting")
        .joins(customer_events: :customer)
        .joins(:color)
        .order("events.event_date DESC")
  end
  def self.transaction_total
    Event.select("sum(products.product_price * customer_event_products.quantity) AS sales").joins(customer_events: {customer_event_products: :product}).joins(customer_events: :customer)
  end
end
