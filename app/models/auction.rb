class Auction < ApplicationRecord

    def self.import_csv(file)
        auctions = []
        CSV.foreach(file, headers: true) do |row|
            auctions << Auction.new(name: row['auction name'],
                                    street: row['street address'],
                                    city: row['city'],
                                    state: row['state'],
                                    zip: row['zip'])
        end
        Auction.import auctions, on_duplicate_key_ignore: true
    end
end
