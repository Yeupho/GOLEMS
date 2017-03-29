class CustomerEventProduct < ApplicationRecord
  acts_as_paranoid

  belongs_to :customer_event
  belongs_to :product
  belongs_to :pickup_status

end
