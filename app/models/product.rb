class Product < ApplicationRecord

  belongs_to :product_type
  has_many :customer_event_products
  has_many :customer_events, :through => :customer_event_products

end
