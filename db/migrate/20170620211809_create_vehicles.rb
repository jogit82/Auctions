class CreateVehicles < ActiveRecord::Migration[5.0]
  def change
    create_table :vehicles do |t|
      t.integer :year
      t.string :make
      t.string :model
      t.integer :stock_number
      t.integer :winning_big
      t.integer :seller_payout
      t.string :description
      t.string :auction_name

      t.timestamps
    end
  end
end
