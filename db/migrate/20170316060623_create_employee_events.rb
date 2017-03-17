class CreateEmployeeEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :employee_events do |t|
      t.integer :employee_id
      t.integer :event_id
      t.boolean :archive, :default =>false

      t.timestamps
    end
  end
end
