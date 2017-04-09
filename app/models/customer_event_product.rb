class CustomerEventProduct < ApplicationRecord
  after_initialize :set_defaults
  acts_as_paranoid
  validates :quantity, presence: true
  belongs_to :customer_event
  belongs_to :product
  belongs_to :pickup_status

  def set_defaults
    self.pickup_status_id ||= 1
  end

end
