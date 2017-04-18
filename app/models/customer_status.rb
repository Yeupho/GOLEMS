class CustomerStatus < ApplicationRecord
  acts_as_paranoid
  has_many :customers

end
