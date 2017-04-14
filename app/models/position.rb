class Position < ApplicationRecord
  acts_as_paranoid
  belongs_to :employee_type, -> { with_deleted }
  belongs_to :employee, -> { with_deleted }


end
