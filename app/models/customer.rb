class Customer < ApplicationRecord
  after_initialize :set_defaults
  acts_as_paranoid
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :phone, presence: true
  validates :zipcode, presence: true
  has_many :customer_events
  has_many :events, :through => :customer_events
  belongs_to :customer_status
  belongs_to :state
  belongs_to :country

  def self.search(search)
    if search
      where(['phone LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def set_defaults
    self.customer_status_id ||= 1
  end

  def full_name

    self.first_name + ' ' + self.last_name
  end
<<<<<<< HEAD

=======
>>>>>>> 647072af5a7e2419f250d1f2b2f1439263b327ff
end




