class CreatePositions < ActiveRecord::Migration[5.0]
  def change
    create_table :positions do |t|
      t.integer :employee_id
      t.integer :employee_type_id

      t.timestamps
    end
  end
end
