class ChangeAuctionNameAuctions < ActiveRecord::Migration[5.0]
  def up
    rename_column :auctions, :name, :auction_name
  end

  def down
    rename_column :auctions, :auction_name, :name
  end
end
