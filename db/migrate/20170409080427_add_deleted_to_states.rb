class AddDeletedToStates < ActiveRecord::Migration[5.0]
  def change
    add_column :states, :deleted_at, :datetime
    add_index :states, :deleted_at
  end
end
