class EmployeeType < ApplicationRecord

  has_many :employees, :through => :position
  has_many :positions

end
