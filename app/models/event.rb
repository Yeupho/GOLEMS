class Event < ApplicationRecord
  acts_as_paranoid
  belongs_to :state

end
