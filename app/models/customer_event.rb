class CustomerEvent < ApplicationRecord
  acts_as_paranoid
  validates :event_id, presence: true
  validates :customer_id, presence: true
  validates :number_in_party, presence: true
  belongs_to :customer
  belongs_to :event
  has_many :customer_event_products
  has_many :products, :through => :customer_event_products

  def phone
    customer.try(:phone)
  end
  def phone=(phone)
    self.phone = Customer.find_or_create_by(phone: phone) if phone.present?
  end

  def self.walk_in
    CustomerEvent.select("customer_events.customer_id, customers.first_name || ' ' || customers.last_name AS name, events.event_date, customer_events.id")
        .joins(:event)
        .joins(:customer)
        .where("events.event_type_id = '7'")
  end

  def self.customer_events
    CustomerEvent.select("customer_events.id, event_id, customers.first_name, customers.last_name, kids_painting, adults_painting, number_in_party")
        .joins(:customer)
        .order("customers.first_name ASC")
  end
  def self.customer_total
    CustomerEvent.select("sum((((products.product_price * customer_event_products.quantity)*.0825)
      + (products.product_price * customer_event_products.quantity)) +
      + (((customer_events.adults_painting*6)*0.0825)+(customer_events.adults_painting*6))
      + (customer_events.kids_painting*5)+((customer_events.kids_painting*5)*.0825)) AS sales").joins(customer_event_products: :product)
  end

  def self.check_in
    CustomerEvent.select("customers.first_name, customers.last_name, events.event_date, events.start_time, events.end_time, events.event_name, customer_events.number_in_party")
        .joins(:customer)
        .joins(:event)
        .where("events.event_date = ?", Date.today)
        .where("events.event_type_id <> '7'")
        .order("events.start_time ASC, customers.first_name ASC, customers.last_name ASC")
  end
  def self.party_size
    CustomerEvent.select("sum(number_in_party) AS number_in_party, sum(adults_painting) AS adults_painting, sum(kids_painting) AS kids_painting")
        .joins(:event)
  end
end
