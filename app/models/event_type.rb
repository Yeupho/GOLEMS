class EventType < ApplicationRecord
  acts_as_paranoid
  has_many :events

  def self.CountType
    Event.where(:event_date => 1.months.ago .. Time.now)
        .joins(:event_type).group(:event_type_desc).count(:event_type_desc).first(5)
  end
end
