class Position < ApplicationRecord

  has_many :employees
  has_many :employee_types
end
