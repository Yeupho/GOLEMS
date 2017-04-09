class AddDeletedToEmployeeTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :employee_types, :deleted_at, :datetime
    add_index :employee_types, :deleted_at
  end
end
