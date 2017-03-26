class AddDeletedAtToCustomerEventProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :customer_event_products, :deleted_at, :datetime
    add_index :customer_event_products, :deleted_at
  end
end
