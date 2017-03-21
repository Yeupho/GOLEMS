class Employee < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :state_id, presence: true
  validates :zipcode, presence: true
  validates :country_id, presence: true
  validates :employee_status_id, presence: true
  has_many :employee_events
  has_many :events, :through => :employee_event
  belongs_to :employee_status
  belongs_to :employee_type
  belongs_to :state
end
