class EventType < ApplicationRecord
  acts_as_paranoid
  has_many :events

end
