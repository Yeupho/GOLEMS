class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :event_date
      t.time :start_time
      t.time :end_time
      t.integer :event_type_id
      t.integer :color_id, :default=>1
      t.integer :event_status_id, :default=>1
      t.string :event_description

      t.timestamps
    end
  end
end
