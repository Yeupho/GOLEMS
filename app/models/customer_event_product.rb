class CustomerEventProduct < ApplicationRecord

  belongs_to :customer_event
  belongs_to :product
  belongs_to :pickup_status

end
