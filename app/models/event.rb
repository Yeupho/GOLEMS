class Event < ApplicationRecord

  validates :event_name, presence: true
  validates :event_date, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :event_type_id, presence: true
  validates :color_id, presence: true
  validates :event_status_id, presence: true
  validates :event_description, presence: true
  has_many :customer_events
  has_many :customers, :through => :customer_event
  has_many :employee_events
  has_many :employees, :through => :employee_event
  belongs_to :color
  belongs_to :event_status
  belongs_to :event_type
end
