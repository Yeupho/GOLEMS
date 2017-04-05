class AddDeletedAtToEventTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :event_types, :deleted_at, :datetime
    add_index :event_types, :deleted_at
  end
end
