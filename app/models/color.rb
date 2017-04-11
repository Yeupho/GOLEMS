class Color < ApplicationRecord
  acts_as_paranoid
  validates :color_code, presence: true
  validates :color_name, presence: true
  has_many :events


  def self.search(search)
    if search
      where(['color_name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

end