class Auction < ApplicationRecord
    has_many :vehicles

    def self.import_csv(file)
        auctions = []
        CSV.foreach(file, headers: true) do |row|
            auctions << Auction.new(name: row['auction name'],
                                    street: row['street address'],
                                    city: row['city'],
                                    state: row['state'],
                                    zip: row['zip'])
        end
        Auction.import(auctions)
    end
    
end
