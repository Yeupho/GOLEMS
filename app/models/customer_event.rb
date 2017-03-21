class CustomerEvent < ApplicationRecord

  validates :event_id, presence: true
  validates :customer_id, presence: true
  validates :number_in_party, presence: true
  validates :adults_painting, presence: true
  validates :kids_painting, presence: true
  belongs_to :customer
  belongs_to :event
  has_many :customer_event_products
  has_many :products, :through => :customer_event_product
end
