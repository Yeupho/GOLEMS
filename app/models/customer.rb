class Customer < ApplicationRecord
  after_initialize :set_defaults
  acts_as_paranoid

  has_many :customer_events
  has_many :events, :through => :customer_events
  belongs_to :customer_status
  belongs_to :state
  belongs_to :country

  def set_defaults
    self.customer_status_id ||= 1
  end

end
