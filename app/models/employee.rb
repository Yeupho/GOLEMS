class Employee < ApplicationRecord

  has_many :employee_events
  has_many :employee_type, :through => :position
  has_many :events, :through => :employee_events
  belongs_to :employee_status
  belongs_to :position
  belongs_to :state
  belongs_to :country

end
