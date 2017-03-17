class CreateCustomerEventProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_event_products do |t|
      t.integer :customer_event_id
      t.integer :product_id
      t.integer :quantity
      t.integer :pickup_status_id
      t.boolean :archive, :default =>false

      t.timestamps
    end
  end
end
