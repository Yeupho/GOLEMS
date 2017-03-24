class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :address
      t.string :city
      t.integer :state_id
      t.integer :zipcode
      t.integer :country_id
      t.string :comment
      t.integer :customer_status_id

      t.timestamps
    end
  end
end
