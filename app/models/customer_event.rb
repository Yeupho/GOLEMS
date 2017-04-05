class CustomerEvent < ApplicationRecord
  acts_as_paranoid
  validates :event_id, presence: true
  validates :customer_id, presence: true
  validates :number_in_party, presence: true
  belongs_to :customer
  belongs_to :event
  has_many :customer_event_products
  has_many :products, :through => :customer_event_products

  def phone
    customer.try(:phone)
  end

  def phone=(phone)
    self.phone = Customer.find_or_create_by(phone: phone) if phone.present?
  end

end
