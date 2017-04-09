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

  def self.product
    CustomerEventProduct.select("customer_event_id, products.product_name, quantity, products.product_price, pickup_status_id, pickup_statuses.pickup_status_desc, sum(quantity * products.product_price) AS sales")
        .joins(:product)
        .joins(:pickup_status)
        .group("customer_event_id, products.product_name, quantity, products.product_price, pickup_status_id, pickup_statuses.pickup_status_desc")
        .order("pickup_status_id ASC")
  end
end
