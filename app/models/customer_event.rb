class CustomerEvent < ApplicationRecord
  acts_as_paranoid

  belongs_to :customer
  belongs_to :event
  has_many :customer_event_products
  has_many :products, :through => :customer_event_products

end
