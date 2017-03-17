class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :product_name
      t.decimal :product_price
      t.integer :product_type_id
      t.boolean :archive, :default =>false

      t.timestamps
    end
  end
end
