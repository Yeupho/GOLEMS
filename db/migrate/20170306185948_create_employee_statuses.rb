class CreateEmployeeStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_statuses do |t|
      t.integer :employee_status_desc

      t.timestamps
    end
  end
end
