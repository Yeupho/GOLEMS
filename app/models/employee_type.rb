class EmployeeType < ApplicationRecord

  has_many :employees, :through => :positions
  has_many :positions

end
