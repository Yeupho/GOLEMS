class Customer < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :zipcode, presence: true
  has_many :customer_events
  has_many :events, :through => :customer_event
  belongs_to :customer_status
  belongs_to :state
  belongs_to :country

  acts_as_paranoid
end
