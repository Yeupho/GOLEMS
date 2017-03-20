class EmployeeType < ApplicationRecord

  has_many :employees, :through => :position
  belongs_to :position

end
