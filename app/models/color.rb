class Color < ApplicationRecord
  validates :color_code, presence: true
  validates :color_name, presence: true
  has_many :events

end