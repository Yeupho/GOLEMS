class CreateCustomerEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_events do |t|
      t.integer :event_id
      t.integer :customer_id
      t.integer :number_in_party
      t.integer :adults_painting
      t.integer :kids_painting
      t.boolean :deposit
      t.decimal :customer_total

      t.timestamps
    end
  end
end
