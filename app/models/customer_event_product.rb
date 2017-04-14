class CustomerEventProduct < ApplicationRecord
  after_initialize :set_defaults
  acts_as_paranoid
  validates :quantity, presence: true
  belongs_to :customer_event
  belongs_to :product
  belongs_to :pickup_status

  def set_defaults
    self.pickup_status_id ||= 1
  end

  def self.customer_event_products
    CustomerEventProduct.select("customer_event_products.id, products.product_name, quantity, products.product_price, pickup_status_id, pickup_statuses.pickup_status_desc, sum(quantity * products.product_price) AS sales")
        .joins(:product)
        .joins(:pickup_status)
        .group("customer_event_products.id, products.product_name, quantity, products.product_price, pickup_status_id, pickup_statuses.pickup_status_desc")
        .order("pickup_status_id ASC")
  end

  def self.customer_not_ready
    CustomerEventProduct.select("customer_event_products.id, products.product_name, colors.color_code, events.event_name, events.event_date, pickup_status_id, quantity")
        .joins(:product)
        .joins(:customer_event)
        .joins(customer_event: {event: :color})
        .joins(customer_event: :customer)
        .order("events.event_date ASC")
        .where(pickup_status_id: '1')
  end

  def self.customer_ready
    CustomerEventProduct.select("customer_event_products.id, products.product_name, colors.color_code, events.event_name, events.event_date, pickup_status_id, quantity")
        .joins(:product)
        .joins(:customer_event)
        .joins(customer_event: {event: :color})
        .joins(customer_event: :customer)
        .order("products.product_name ASC")
        .where(pickup_status_id: '2')
  end

  def self.customer_collected
    CustomerEventProduct.select("customer_event_products.id, products.product_name, colors.color_code, events.event_name, events.event_date, pickup_status_id, quantity")
        .joins(:product)
        .joins(:customer_event)
        .joins(customer_event: {event: :color})
        .joins(customer_event: :customer)
        .joins(:pickup_status)
        .order("events.event_date DESC")
        .where(pickup_status_id: '3')
        .where("events.event_date > ?", (Date.today - 1.month))
  end

  def self.transactions
    CustomerEvent.select("customer_events.id, events.event_name, colors.color_code, events.event_date, kids_painting, adults_painting, sum(products.product_price * customer_event_products.quantity) AS sales")
        .joins(:customer)
        .joins(event: :color)
        .joins(customer_event_products: :product)
        .group("customer_events.id, events.event_name, colors.color_code, events.event_date, kids_painting, adults_painting")
        .order("events.event_date DESC")
  end

  def self.pickup_progress
    CustomerEventProduct.select("customer_event_products.id, customers.first_name, customers.last_name, customers.phone, products.product_name, quantity, colors.color_code, events.event_name, events.event_date, events.start_time, pickup_status_id")
        .joins(:product)
        .joins(customer_event: :customer)
        .joins(customer_event: {event: :color})
        .where(pickup_status_id: 1)
        .order("events.event_date ASC")
  end
  def self.pickup_ready
    CustomerEventProduct.select("customer_event_products.id, customers.first_name, customers.last_name, customers.phone, products.product_name, quantity, colors.color_code, events.event_name, events.event_date, events.start_time, pickup_status_id")
        .joins(:product)
        .joins(customer_event: :customer)
        .joins(customer_event: {event: :color})
        .where(pickup_status_id: 2)
        .where("events.event_date > ?", (Date.today - 6.month))
        .order("customers.first_name ASC, customers.last_name ASC")
  end
  def self.pickup_picked
    CustomerEventProduct.select("customer_event_products.id, customers.first_name, customers.last_name, customers.phone, products.product_name, quantity, colors.color_code, events.event_name, events.event_date, events.start_time, pickup_status_id, customer_event_products.updated_at")
        .joins(:product)
        .joins(customer_event: :customer)
        .joins(customer_event: {event: :color})
        .where(pickup_status_id: 3)
        .where("events.event_date > ?", (Date.today - 1.month))
        .order("customer_event_products.updated_at DESC")
  end

  def self.progress_count
    CustomerEventProduct.joins(customer_event: :customer).where("pickup_status_id = '1'")
  end
  def self.ready_count
    CustomerEventProduct.joins(customer_event: :customer).where("pickup_status_id = '2'").joins(customer_event: :event)
  end
  def self.picked_up_count
    CustomerEventProduct.joins(customer_event: :customer).joins(customer_event: :event).where("pickup_status_id = '3'").where("events.event_date > ?", (Date.today - 1.month))
  end
end
