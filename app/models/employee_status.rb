class EmployeeStatus < ApplicationRecord
  acts_as_paranoid
  has_many :employees

end
