class MainController < ApplicationController
    def index
        @auctions = Auction.select("DISTINCT vehicles.auction_name, auctions.city, COUNT(vehicles.stock_number) AS total_vehicle, SUM(vehicles.winning_bid) AS total_bid, SUM(vehicles.seller_payout) AS total_payout")
                    .joins("INNER JOIN vehicles ON vehicles.auction_name = auctions.auction_name")
                    .group("vehicles.auction_name, auctions.city")
    end

    def import
        begin
            Auction.import_csv(params[:file].path)
            flash[:success] = "CSV file has imported into the database successfully."
            redirect_to root_url
        rescue => exception
            if params[:file].nil?
                flash[:danger] = "Import failed. No CSV file selected. Please choose a CSV file from your computer."
            else
                flash[:danger] = "Import failed. Make sure it is a valid CSV file."
            end
            redirect_to root_url
        end
    end  
end
