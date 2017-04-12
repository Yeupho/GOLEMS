class Product < ApplicationRecord
  acts_as_paranoid
  validates :product_name, presence: true
  validates :product_price, presence: true
  belongs_to :product_type
  has_many :customer_event_products
  has_many :customer_events, :through => :customer_event_products

end
