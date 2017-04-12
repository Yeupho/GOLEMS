class Admin < ApplicationRecord

# Query to view the number of sales during the past week
  def self.weeklysales
    Event.where(:event_date => 1.week.ago .. Time.now)
        .joins(:customer_events)
        .joins(:customer_event_products)
        .joins(:products)
        .sum("(((products.product_price * customer_event_products.quantity)*.0825)
      + (products.product_price * customer_event_products.quantity)) +
      + (((customer_events.adults_painting*6)*0.0825)+(customer_events.adults_painting*6))
      + (customer_events.kids_painting*5)+((customer_events.kids_painting*5)*.0825)")
  end
 # Query to view the number of sales from two weeks ago
  def self.twoweeksprior
    Event.where(:event_date => 2.weeks.ago .. 8.days.ago)
        .joins(:customer_events)
        .joins(:customer_event_products)
        .joins(:products)
        .sum("(((products.product_price * customer_event_products.quantity)*.0825)
      + (products.product_price * customer_event_products.quantity)) +
      + (((customer_events.adults_painting*6)*0.0825)+(customer_events.adults_painting*6))
      + (customer_events.kids_painting*5)+((customer_events.kids_painting*5)*.0825)")
  end
  #Query to view the total number of visitors during the past week
  def self.totalvisitors
    Event.where(:event_date => 1.week.ago .. Time.now)
        .joins(:customer_events)
        .joins(:customer_event_products)
        .sum("customer_events.number_in_party")
  end
  # Query to view the total number of visitors two weeks ago
  def self.twototalvisitors
    Event.where(:event_date => 2.week.ago .. 8.days.ago)
        .joins(:customer_events)
        .joins(:customer_event_products)
        .sum("customer_events.number_in_party")
  end
  # Query to view the number of products sold during the past week
  def self.productsold
    Event.where(:event_date => 1.week.ago .. Time.now)
        .joins(:customer_events)
        .joins(:customer_event_products)
        .sum("customer_event_products.quantity")
  end
  # Query to view the number of products sold two weeks ago
  def self.twoproductsold
    Event.where(:event_date => 2.week.ago .. 8.days.ago)
        .joins(:customer_events)
        .joins(:customer_event_products)
        .sum("customer_event_products.quantity")
  end

  # Query to view the number of products that have been set to ready in the past week
  def self.productsready
    Event.where(:event_date => 1.week.ago .. Time.now)
        .where('customer_event_products.pickup_status_id = 2')
        .joins(:customer_events)
        .joins(:customer_event_products)
        .count("customer_event_products.id")
  end
  # Query to view the number of products that have been set to ready two weeks ago
  def self.twoproductsready
    Event.where(:event_date => 2.week.ago .. 8.days.ago)
        .where('customer_event_products.pickup_status_id = 2')
        .joins(:customer_events)
        .joins(:customer_event_products)
        .count("customer_event_products.id")
  end
end


