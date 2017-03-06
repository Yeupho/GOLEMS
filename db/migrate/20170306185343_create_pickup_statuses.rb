class CreatePickupStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :pickup_statuses do |t|
      t.string :pickup_status_desc

      t.timestamps
    end
  end
end
