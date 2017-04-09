class Customer < ApplicationRecord
  after_initialize :set_defaults
  acts_as_paranoid
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :zipcode, presence: true
  has_many :customer_events
  has_many :events, :through => :customer_events
  belongs_to :customer_status
  belongs_to :state
  belongs_to :country

  def self.search(search)
    if search
      where(['phone LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def set_defaults
    self.customer_status_id ||= 1
  end

  def full_name
    self.first_name + ' ' + self.last_name
  end

  def self.not_ready
    CustomerEventProduct.select("products.product_name, colors.color_code, events.event_name, events.event_date, pickup_status_id, quantity")
        .joins(:product)
        .joins(:customer_event)
        .joins(customer_event: {event: :color})
        .joins(customer_event: :customer)
        .order("events.event_date ASC")
        .where(pickup_status_id: '1')
  end

  def self.ready
    CustomerEventProduct.select("products.product_name, colors.color_code, events.event_name, events.event_date, pickup_status_id, quantity")
        .joins(:product)
        .joins(:customer_event)
        .joins(customer_event: {event: :color})
        .joins(customer_event: :customer)
        .order("events.event_date ASC")
        .where(pickup_status_id: '2')
  end

  def self.collected
    CustomerEventProduct.select("products.product_name, colors.color_code, events.event_name, events.event_date, pickup_status_id, quantity")
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




