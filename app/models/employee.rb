class Employee < ApplicationRecord
  after_initialize :set_defaults
  acts_as_paranoid
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :zipcode, presence: true
  has_many :employee_events, -> { with_deleted }
  has_many :positions, -> { with_deleted }
  has_many :employee_types, :through => :positions
  has_many :events, :through => :employee_events
  belongs_to :employee_status, -> { with_deleted }
  belongs_to :state, -> { with_deleted }
  belongs_to :country, -> { with_deleted }

  def set_defaults
    self.employee_status_id ||= 1
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name2
    self.first_name + ' ' + self.last_name
  end

  def self.employees
    Employee.select("employees.id, first_name, last_name, phone, email, employee_status_id")
        .where("employee_status_id = '1'")
        .order("first_name ASC, last_name ASC")
  end

  def self.co_host
    Employee.select("employees.id, first_name, last_name, employee_status_id").joins(employee_events: :event).order("first_name")
  end
end
