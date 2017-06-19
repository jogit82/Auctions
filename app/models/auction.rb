class Auction < ActiveRecord::Base
    def self.import(file)  
        CSV.foreach(file, headers: true) do |row|
            Auction.create! row.to_hash
        end
    end
end
