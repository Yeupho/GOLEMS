class AddDeletedAtToCustomerEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :customer_events, :deleted_at, :datetime
    add_index :customer_events, :deleted_at
  end
end
