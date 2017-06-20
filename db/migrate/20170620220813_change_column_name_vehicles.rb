class ChangeColumnNameVehicles < ActiveRecord::Migration[5.0]
  def change
    rename_column :vehicles, :winning_big, :winning_bid
  end
end
