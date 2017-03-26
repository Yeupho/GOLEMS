class AddDeletedAtToEmployeeEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :employee_events, :deleted_at, :datetime
    add_index :employee_events, :deleted_at
  end
end
