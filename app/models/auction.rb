class Auction < ApplicationRecord
    has_many :vehicles
    def self.import_csv(file)
        CSV.foreach(file, headers: true) do |row|
            auction = Auction.new(auction_name: row['auction name'],
                                    street: row['street address'],
                                    city: row['city'],
                                    state: row['state'],
                                    zip: row['zip'])

            vehicle = Vehicle.new(year: row['vehicle year'],
                                    make: row['vehicle make'],
                                    model: row['vehicle model'],
                                    stock_number: row['vehicle stock number'],
                                    winning_bid: row['winning bid'],
                                    seller_payout: row['seller payout'],
                                    description: row['description'],
                                    auction_name: row['auction name'])
            begin
                Auction.import [auction]
            rescue ActiveRecord::RecordNotUnique
            end
            begin
                Vehicle.import [vehicle]
            rescue ActiveRecord::RecordNotUnique
                next
            end
        end
    end
end