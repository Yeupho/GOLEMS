class Event < ApplicationRecord
  acts_as_paranoid
  validates :event_name, presence: true
  has_many :customer_events
  has_many :customers, :through => :customer_event
  has_many :employee_events
  has_many :employees, :through => :employee_event
  belongs_to :color
  belongs_to :event_status
  belongs_to :event_type

end
