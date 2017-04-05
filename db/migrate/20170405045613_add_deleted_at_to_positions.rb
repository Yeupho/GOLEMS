class AddDeletedAtToPositions < ActiveRecord::Migration[5.0]
  def change
    add_column :positions, :deleted_at, :datetime
    add_index :positions, :deleted_at
  end
end
