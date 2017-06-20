class Vehicle < ApplicationRecord
    def self.import_csv(file)
        vehicles = []
        CSV.foreach(file, headers: true) do |row|
            vehicles << Vehicle.new(year: row['vehicle year'],
                                    make: row['vehicle make'],
                                    model: row['vehicle model'],
                                    stock_number: row['vehicle stock number'],
                                    winning_bid: row['winning bid'],
                                    seller_payout: row['seller payout'],
                                    description: row['desription'],
                                    auction_name: row['auction name'])
        end
        Vehicle.import(vehicles)
    end
end
