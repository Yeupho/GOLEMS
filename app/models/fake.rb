class Fake < ApplicationRecord



  def self.productsold
    Event.select("sum(customer_event_products.quantity) AS productsold")
        .joins(customer_events: :customer_event_products)
        .where("events.event_date >= ?", (Date.today - 1.week))
        .where("events.event_date <= ?", Date.today)
  end

  def self.twoproductsold
    Event.select("sum(customer_event_products.quantity) AS productsold")
        .joins(customer_events: :customer_event_products)
        .where("events.event_date <= ?", (Date.today - 1.week))
        .where("events.event_date >= ?", (Date.today - 2.week))
  end





  # def self.productsready
  #   Event.select("sum(customer_event_products.quantity) AS ready")
  #       .joins(customer_events: :customer_event_products)
  #       .where("events.event_date >= ?", (Date.today - 1.week))
  #       .where("pickup_status_id = '2'")
  #       .where("events.event_date <= ?", Date.today)
  # end
  #
  # def self.twoproductsready
  #   Event.select("sum(customer_event_products.quantity) AS ready")
  #       .joins(customer_events: :customer_event_products)
  #       .where("events.event_date <= ?", (Date.today - 1.week))
  #       .where("events.event_date >= ?", (Date.today - 2.week))
  #       .where("pickup_status_id = '2'")
  #
  # end

  def self.productsready
    Event.select("sum(customer_event_products.quantity) AS ready")
        .joins(customer_events: :customer_event_products)
        .where("customer_events.updated_at >= ?", (Date.today - 1.week))
        .where("pickup_status_id = '2'")
        .where("customer_events.updated_at <= ?", 8.hours.from_now)
  end

  def self.twoproductsready
    Event.select("sum(customer_event_products.quantity) AS ready")
        .joins(customer_events: :customer_event_products)
        .where("customer_events.updated_at <= ?", (Date.today - 1.week))
        .where("customer_events.updated_at >= ?", (Date.today - 2.week))
        .where("pickup_status_id = '2'")
  end



  def self.totalvisitors
    Event.select("sum(customer_events.number_in_party) AS sum")
        .joins(:customer_events).where("events.event_date >= ?", (Date.today - 1.week))
        .where("events.event_date <= ?", Date.today)
  end

  def self.twototalvisitors
    Event.select("sum(customer_events.number_in_party) AS sum")
        .joins(:customer_events).where("events.event_date <= ?", (Date.today - 1.week))
        .where("events.event_date >= ?", (Date.today - 2.week))
  end





  # Query to find total kids and adults to be used in calculation
  def self.weeklysales_studio
    Event.select("sum(kids_painting) AS kids_painting, sum(adults_painting) AS adults_painting")
        .joins(:customer_events)
        .where("events.event_date >= ?", (Date.today - 1.week))
        .where("events.event_date <= ?", Date.today)
  end

  # Query to find total sales by itself
  def self.weeklysales_transactions
    Event.select("sum(products.product_price * customer_event_products.quantity) AS sales")
        .joins(customer_events: {customer_event_products: :product})
        .where("events.event_date >= ?", (Date.today - 1.week))
        .where("events.event_date <= ?", Date.today)
  end


  # Query to find total kids and adults to be used in calculation from two weeks prior
  def self.twoweeksprior_studio
    Event.select("sum(kids_painting) AS kids_painting, sum(adults_painting) AS adults_painting")
        .joins(:customer_events)
        .where("events.event_date >= ?", (Date.today - 2.week))
        .where("events.event_date <= ?", (Date.today - 1.week))
  end

  # Query to find total sales by itself from two weeks prior
  def self.twoweeksprior_transactions
    Event.select("sum(products.product_price * customer_event_products.quantity) AS sales")
        .joins(customer_events: {customer_event_products: :product})
        .where("events.event_date >= ?", (Date.today - 2.week))
        .where("events.event_date <= ?", (Date.today - 1.week))
  end


  def self.NumAttending
    Event.group_by_week(:event_date)
        .where("event_date >= ?", Date.today - 1.month.ago)
        .where("event_date <= ?", Date.today)
        .joins(:customer_events).sum("customer_events.number_in_party")
  end








end


