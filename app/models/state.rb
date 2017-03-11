class State < ApplicationRecord

  has_many :employees
  has_many :customers

end
