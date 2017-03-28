class Employee < ApplicationRecord
  acts_as_paranoid
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true
  has_many :employee_events
  has_many :employee_type, :through => :position
  has_many :positions
  has_many :events, :through => :employee_event
  belongs_to :employee_status
  belongs_to :state
  belongs_to :country

end
