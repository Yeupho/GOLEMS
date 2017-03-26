class Customer < ApplicationRecord

  has_many :customer_events
  has_many :events, :through => :customer_events
  belongs_to :customer_status
  belongs_to :state
  belongs_to :country

  acts_as_paranoid
end
