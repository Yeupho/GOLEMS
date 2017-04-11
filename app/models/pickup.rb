
class Pickup

  def self.progress
    CustomerEventProduct.joins(:customer_event).joins(customer_event: :customer).joins(customer_event: {event: :color}).where(pickup_status_id: 1)

  end
  def self.picked
    CustomerEventProduct.joins(:customer_event).joins(customer_event: :customer).joins(customer_event: {event: :color}).where(pickup_status_id: 3)

  end

  def self.ready
    CustomerEventProduct.joins(:customer_event).joins(customer_event: :customer).joins(customer_event: {event: :color}).where(pickup_status_id: 2)
  end

end