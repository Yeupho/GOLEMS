class Employee < ApplicationRecord
  after_initialize :set_defaults
  acts_as_paranoid

  has_many :employee_events
  has_many :employee_type, :through => :positions
  has_many :positions
  has_many :events, :through => :employee_events
  belongs_to :employee_status
  belongs_to :state
  belongs_to :country

  def set_defaults
    self.employee_status_id ||= 1
  end

end
