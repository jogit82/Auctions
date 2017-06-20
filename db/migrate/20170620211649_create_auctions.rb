class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
