class Employee < ApplicationRecord
  has_many :employee_types, through: :positions
end
