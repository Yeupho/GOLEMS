class Employee < ApplicationRecord

  has_many :employee_events
  has_many :events, :through => :employee_events
  belongs_to :employee_status
  belongs_to :employee_type
  belongs_to :state

end
