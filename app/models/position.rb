class Position < ApplicationRecord
  acts_as_paranoid
  belongs_to :employee_type
  belongs_to :employee

end
