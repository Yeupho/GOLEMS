class Admin < ApplicationRecord


  def self.weeklysales
    Event.where(:event_date => 1.week.ago .. Time.now)
        .joins(:customer_events)
        .joins(:customer_event_products)
        .joins(:products)
        .sum("(products.product_price * customer_event_products.quantity)+ (customer_events.adults_painting + 10)")
  end
end


