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
    CustomerEventProduct.select("customer_event_id, products.product_name, quantity, products.product_price, pickup_status_id, pickup_statuses.pickup_status_desc, sum(quantity * products.product_price) AS sales")
        .joins(:product)
        .joins(:pickup_status)
        .group("customer_event_id, products.product_name, quantity, products.product_price, pickup_status_id, pickup_statuses.pickup_status_desc")
        .order("pickup_status_id ASC")
  end

  def self.not_ready
    CustomerEventProduct.select("customer_event_id, products.product_name, colors.color_code, events.event_name, events.event_date, pickup_status_id, quantity")
        .joins(:product)
        .joins(:customer_event)
        .joins(customer_event: {event: :color})
        .joins(customer_event: :customer)
        .order("events.event_date ASC")
        .where(pickup_status_id: '1')
  end

  def self.ready
    CustomerEventProduct.select("customer_event_id, products.product_name, colors.color_code, events.event_name, events.event_date, pickup_status_id, quantity")
        .joins(:product)
        .joins(:customer_event)
        .joins(customer_event: {event: :color})
        .joins(customer_event: :customer)
        .order("products.product_name ASC")
        .where(pickup_status_id: '2')
  end

  def self.collected
    CustomerEventProduct.select("customer_event_id, products.product_name, colors.color_code, events.event_name, events.event_date, pickup_status_id, quantity")
        .joins(:product)
        .joins(:customer_event)
        .joins(customer_event: {event: :color})
        .joins(customer_event: :customer)
        .joins(:pickup_status)
        .order("events.event_date DESC")
        .where(pickup_status_id: '3')
  end

  def self.transactions
    CustomerEvent.select("customer_events.id, events.event_name, colors.color_code, events.event_date, sum(products.product_price * customer_event_products.quantity) AS sales")
        .joins(:customer)
        .joins(event: :color)
        .joins(customer_event_products: :product)
        .group("customer_events.id, events.event_name, colors.color_code, events.event_date")
        .order("events.event_date DESC")
  end
end
