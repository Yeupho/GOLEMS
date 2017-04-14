class EmployeeType < ApplicationRecord
  acts_as_paranoid
  has_many :employees, :through => :positions
  has_many :positions

  def self.employee_position
    EmployeeEvent.select("employee_events.id, employees.first_name, employees.last_name").joins(:employee).joins(:event)
  end

  def self.positions
    EmployeeType.select("employee_type_desc").joins(:employees)
  end
end
