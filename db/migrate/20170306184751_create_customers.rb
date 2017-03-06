class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :lastname
      t.string :email
      t.integer :phone
      t.string :address
      t.string :city
      t.integer :state_id
      t.integer :zipcode
      t.text :comments
      t.integer :customer_status_id

      t.timestamps
    end
  end
end
