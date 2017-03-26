class Position < ApplicationRecord

  belongs_to :employee_type
  belongs_to :employee

end
