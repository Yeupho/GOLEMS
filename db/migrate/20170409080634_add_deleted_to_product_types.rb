class AddDeletedToProductTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :product_types, :deleted_at, :datetime
    add_index :product_types, :deleted_at
  end
end
