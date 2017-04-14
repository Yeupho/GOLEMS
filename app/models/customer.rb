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

  def self.customers
    Customer.select("customers.id, first_name, last_name, phone, email, customer_status_id")
        .where("customer_status_id = '1'")
        .order("first_name ASC")
  end

  def self.total_spending
    Customer.select("sum(products.product_price * customer_event_products.quantity) AS sales, (customer_events.kids_painting * 5) AS kids, (customer_events.adults_painting * 6) AS adults, customer_status_id")
        .joins(customer_events: {customer_event_products: :product})
        .group("customer_events.kids_painting, customer_events.adults_painting, customer_status_id")
  end
end




