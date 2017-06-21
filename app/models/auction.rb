class Auction < ApplicationRecord
    has_many :vehicles
    def self.import_csv(file)
        auctions = []
        CSV.foreach(file, headers: true) do |row|
            auction = Auction.new(name: row['auction name'],
                                    street: row['street address'],
                                    city: row['city'],
                                    state: row['state'],
                                    zip: row['zip'])
            auction.vehicles.build(year: row['vehicle year'],
                                    make: row['vehicle make'],
                                    model: row['vehicle model'],
                                    stock_number: row['vehicle stock number'],
                                    winning_bid: row['winning bid'],
                                    seller_payout: row['seller payout'],
                                    description: row['description'],
                                    auction_name: row['auction name'])
            auctions << auction
        end

        begin
            Auction.import auctions, recursive: true
            # Auction.import auctions, recursive: true, validate: false, on_duplicate_key_update: [:name]
        rescue
        end
        # Auction.import auctions, recursive: true, validate: false, on_duplicate_key_update: [:name]
        # Auction.import auctions, :validate => false, :on_duplicate_key_update => [:name]
    end
end