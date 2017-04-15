module AdminHelper
  def rangegraph(object1,object2)
    Event.where(:event_date => object1 .. object2)
        .joins(:customer_events).joins(:customer_event_products).joins(:products).group(:product_name)
        .sum('customer_event_products.quantity').first(5)
  end

  def numattend(object1, object2)
    Event.group_by_week(:event_date)
        .where(:event_date =>object1..object2)
        .joins(:customer_events).sum("customer_events.number_in_party")
  end

  def revenuegla(object1, object2)
    Event.group_by_day(:event_date)
        .where(:event_date =>object1..object2)
        .joins(:customer_events)
        .joins(:customer_event_products)
        .joins(:products)
        .sum("(products.product_price * customer_event_products.quantity)
            +(customer_events.adults_painting*6)
            +(customer_events.kids_painting*5)")
  end

  def counthosts(object1, object2)
    EmployeeEvent.group(:first_name).group_by_month(:event_date)
        .where(:event_date =>object1..object2)
        .joins(:event).joins(:employee).count

  end

  def prodpurchase(object1, object2)
    Event.group_by_day(:event_date)
        .where(:event_date =>object1..object2)
        .joins(:customer_events)
        .joins(:customer_event_products)
        .joins(:products)
        .sum("customer_event_products.quantity")
  end

end