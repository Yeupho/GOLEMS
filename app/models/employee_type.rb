class EmployeeType < ApplicationRecord
  acts_as_paranoid
  has_many :employees, :through => :positions
  has_many :positions

  def self.positions
    EmployeeType.select("employee_type_desc").joins(:employees)
  end
end
