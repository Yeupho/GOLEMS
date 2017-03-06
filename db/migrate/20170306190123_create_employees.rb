class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :phone
      t.string :address
      t.string :city
      t.integer :state_id
      t.integer :zipcode
      t.text :comments
      t.decimal :payrate
      t.integer :employee_status_id
      t.integer :employee_type

      t.timestamps
    end
  end
end
