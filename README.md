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

* Challenges encountered during app development  
-First time using a CSV parser. Without the real example_data.csv file, I made my own with assumptions that it contains a header line and there will always be data in each column. I have included it in this repository under the main path.  
-Decided to put everything in Main Controller since it is a fairly simple app with just one page. I could have separate it into two controllers - Main(Index) and Auction(Import,Index)

