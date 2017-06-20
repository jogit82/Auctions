class MainController < ApplicationController
    def index
        @auctions = Vehicle.all
    end

    def import
        begin
            Auction.import_csv(params[:file].path)
            Vehicle.import_csv(params[:file].path)
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
