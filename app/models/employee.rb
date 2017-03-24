class Employee < ApplicationRecord
  acts_as_paranoid
  has_many :employee_types, through: :positions
end
