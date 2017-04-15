class Admin < ApplicationRecord

# =============================
# Graph for top 5 products during the span of 1 month
  def self.MostPopProd5
    Event.where(:event_date => 1.months.ago .. Time.now)
        .joins(:customer_events).joins(:customer_event_products).joins(:products).group(:product_name)
        .sum('customer_event_products.quantity').first(5)
  end
  # Graph for Numbers attenidng for 1 month
  def self.NumAttending
    Event.where(:event_date => 3.months.ago .. Time.now).group_by_week(:event_date)
        .joins(:customer_events).sum("customer_events.number_in_party")
  end
  # Graph for earned revenue
  def self.EarningsRevenue
    Event.group_by_day(:event_date).where(:event_date => 1.months.ago .. Time.now)
        .joins(:customer_events)
        .joins(:customer_event_products)
        .joins(:products)
        .sum('(products.product_price * customer_event_products.quantity)
            +((products.product_price * customer_event_products.quantity)*0.0825)
            +(customer_events.adults_painting*6)
            +(customer_events.kids_painting*5)
            +((customer_events.adults_painting*6)*0.0825)
            +((customer_events.kids_painting*5)*0.0825)');
  end
  def self.MostEvent
    EventType.group_by_day(:event_date).where(:event_date => 1.months.ago .. Time.now)
        .joins(:events).group(:event_type_desc).sum(:event_type_desc)
  end

  #Number of products being purchased over span of 1 month
  def self.DailyPurchase
    Event.group_by_day(:event_date).where(:event_date => 1.month.ago .. Time.now)
        .joins(:customer_events)
        .joins(:customer_event_products)
        .joins(:products)
        .sum("customer_event_products.quantity")
  end

  #Displays the employees that are hosting the most
  def self.RecognizeEmployee
    EmployeeEvent.group(:first_name).group_by_month(:event_date)
        .joins(:event).joins(:employee).count()
  end

  def self.mostprofit

    Event.find_by_sql('SELECT e.event_name, e.event_date,
          ((prod.product_price * cep.quantity)+(ce.adults_painting*6)+(ce.kids_painting*5)
          +((prod.product_price * cep.quantity)*.0825) + ((ce.adults_painting*6)*0.085)
          + ((ce.kids_painting*5)*0.0825)) as revenue
          FROM events e JOIN customer_events ce on e.id = ce.event_id
          JOIN customer_event_products cep ON ce.id=cep.customer_event_id
          JOIN products prod on prod.id = cep.product_id order by revenue desc').first(5)
  end
  # Event.group(:event_name).where(:event_date => 1.months.ago .. Time.now)
  #     .joins(:customer_events)
  #     .joins(:customer_event_products)
  #     .joins(:products)
  #     .sum("(products.product_price * customer_event_products.quantity)+ (customer_events.adults_painting + 10)")
# ==========================================================================
# First row values
# ===========================

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


