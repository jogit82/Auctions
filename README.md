# README
Instructions for setting up and running app  
-sample_data.csv file is in the main project folder  

## Setting It Up
* Ruby version  
ruby 2.2.2p95  

* Rails version  
Rails 5.0.1  

* System dependencies  
$ gem install rails  
$ gem install pg  

* Configuration  
$ git clone git@github.com:jogit82/Auctions.git  
$ cd Auctions  
$ bundle install  

* Database creation  
$ rake db:setup  
$ rake db:migrate  

## Running the App  
$ rails s  
In the browser, open localhost:3000  

* Challenges encountered during development  
1. First time using a CSV parser. Without the real example_data.csv file, I made my own with assumptions that it contains a header line and there will always be data in each column. I have included it in this repository under the main path. Few days later, received the real example_data.csv file. It is a lot bigger(horizontally) than my assumed CSV file. In that case, I decided to make two tables(Auction and Vehicle) and associated them with 1:M relationship. 
2. Using gem Active Record Import - After playing with import for a bit, noticed that it handles MySQL and Postgresql differently. Postgresql had to be upgraded to 9.5+ in order for it to use Model Validation on index key: unique.  
The reason for using this gem is to reduce the number of INSERT operations because it imports data as an object/hash instead of row by row. It makes a difference when importing large CSV file. But in this case, I could not import data as one big hash because each row contains data for more than a table. If I do that, import stops as soon as it encounters duplicate index key on Auction table. Or I can add a nested import to import vehicles. I decided that it will be hard to read and would not save any time.  
In the end I made a decision to separate them. We still only read the CSV file once, but we will create two hashes and import them separately. This gem also allow build method, for example auction.vehicles.build(), it will import vehicles at the same time when auctions are imported. But the problem with this is, if auction stops importing(due to unique key violation), vehicle import will stop too.  
-Decided to put everything in Main Controller since it is a fairly simple app with just one page. I could have separate it into two controllers - Main(Index) and Auction(Import,Show)  

## TODO  
1. [DONE]ignore duplicate records:  
* [DONE]Auction - name  
* [DONE]Vehicle - stock number  
2. [DONE]add table associations: Auctions has many Vehicles, Vehicle belongs to an Auction  
3. [DONE]Display data appropriately  
* [DONE]WHERE,JOIN,GROUP    
4. Write test cases
