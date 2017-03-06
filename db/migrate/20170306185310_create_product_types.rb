class CreateProductTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :product_types do |t|
      t.string :product_type_desc

      t.timestamps
    end
  end
end
