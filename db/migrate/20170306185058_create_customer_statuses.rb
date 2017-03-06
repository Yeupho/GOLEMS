class CreateCustomerStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :customer_statuses do |t|
      t.string :customer_status_description

      t.timestamps
    end
  end
end
