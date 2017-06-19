class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.string :name
      t.string :city
      t.integer :vehicles
      t.float :winning_bid
      t.float :seller_payout

      t.timestamps
    end
  end
end
