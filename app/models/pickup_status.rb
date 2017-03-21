class PickupStatus < ApplicationRecord

  has_many :customer_event_products
  has_many :customer_events, :through => :customer_event_product
  has_many :products, :through => :customer_event_product

end
