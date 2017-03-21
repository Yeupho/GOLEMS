class CustomerEventProduct < ApplicationRecord

  validates :customer_event_id, presence: true
  validates :product_id, presence: true
  validates :quantity, presence: true
  validates :pickup_status_id, presence: true
  belongs_to :customer_event
  belongs_to :product
  belongs_to :pickup_status
end
