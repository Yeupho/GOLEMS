class Event < ApplicationRecord
  after_initialize :set_defaults
  acts_as_paranoid
  validates :event_name, presence: true
  has_many :customer_events
  has_many :customer_event_products, :through => :customer_events
  has_many :products, :through => :customer_event_products
  has_many :customers, :through => :customer_events
  has_many :employee_events
  has_many :employees, :through => :employee_events
  belongs_to :color
  belongs_to :event_status
  belongs_to :event_type

  def set_defaults
    self.event_status_id ||= 1
  end

end
