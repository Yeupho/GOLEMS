class CustomerEvent < ApplicationRecord
  acts_as_paranoid
  validates :event_id, presence: true
  validates :customer_id, presence: true
  validates :number_in_party, presence: true
  validates :deposit, presence: true
  belongs_to :customer
  belongs_to :event
  has_many :customer_event_products
  has_many :products, :through => :customer_event_product

end
