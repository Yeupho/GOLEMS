class CreateEventStatuses < ActiveRecord::Migration[5.0]
  def change
    create_table :event_statuses do |t|
      t.string :event_status_desc

      t.timestamps
    end
  end
end
