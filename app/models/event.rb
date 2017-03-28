class Event < ApplicationRecord
  acts_as_paranoid
  validates :event_name, presence: true
  has_many :customer_events
  has_many :customers, :through => :customer_events
  has_many :employee_events
  has_many :employees, :through => :employee_events
  belongs_to :color
  belongs_to :event_status
  belongs_to :event_type

end
