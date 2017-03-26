class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.integer :state_id
      t.integer :zipcode
      t.integer :country_id
      t.text :comment
      t.integer :employee_status_id, :default=>1

      t.timestamps
    end
  end
end
