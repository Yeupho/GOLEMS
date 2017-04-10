class State < ApplicationRecord
  acts_as_paranoid
  has_many :employees
  has_many :customers

end
