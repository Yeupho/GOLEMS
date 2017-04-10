
class Pickup

  def self.progress
    CustomerEventProduct.select("customers.first_name, customers.last_name, customers.phone, products.product_name, quantity, colors.color_code, events.event_name, events.event_date, events.start_time, pickup_status_id, events.created_at")
        .joins(:product)
        .joins(customer_event: :customer)
        .joins(customer_event: {event: :color})
        .where(pickup_status_id: 1)
        .order("events.created_at DESC")
  end
  def self.picked
    CustomerEventProduct.select("customers.first_name, customers.last_name, customers.phone, products.product_name, quantity, colors.color_code, events.event_name, events.event_date, events.start_time, pickup_status_id, events.updated_at")
        .joins(:product)
        .joins(customer_event: :customer)
        .joins(customer_event: {event: :color})
        .where(pickup_status_id: 3)
        .order("events.updated_at DESC")
  end

  def self.ready
    CustomerEventProduct.select("customers.first_name, customers.last_name, customers.phone, products.product_name, quantity, colors.color_code, events.event_name, events.event_date, events.start_time, pickup_status_id")
        .joins(:product)
        .joins(customer_event: :customer)
        .joins(customer_event: {event: :color})
        .where(pickup_status_id: 2)
        .order("customers.first_name ASC, customers.last_name ASC")
  end
end