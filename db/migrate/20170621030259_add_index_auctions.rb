class AddIndexAuctions < ActiveRecord::Migration[5.0]
  def up
    add_index :auctions, :name, unique: true
  end

  def down
    remove_index :auctions, :name
  end
  
end
