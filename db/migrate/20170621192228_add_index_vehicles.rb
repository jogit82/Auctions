class AddIndexVehicles < ActiveRecord::Migration[5.0]
  def up
    add_index :vehicles, :stock_number, unique: true
  end

  def down
    remove_index :vehicles, :stock_number
  end
end
