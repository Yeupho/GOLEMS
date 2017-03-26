class EmployeeEvent < ApplicationRecord
  acts_as_paranoid

  belongs_to :employee
  belongs_to :event

end
