class EmployeeType < ApplicationRecord
  acts_as_paranoid
  has_many :employees, :through => :positions
  has_many :positions

end
