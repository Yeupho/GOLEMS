class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.date :event_date
      t.time :start_time
      t.time :end_time
      t.integer :event_type_id
      t.integer :color_id
      t.integer :event_status_id
      t.string :event_description
      t.boolean :archive, :default =>false

      t.timestamps
    end
  end
end
