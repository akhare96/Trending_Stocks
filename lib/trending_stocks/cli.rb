
class TrendingStocks::CLI


    def call

        @input = ""

        puts "Welcome to Trending Stocks! Here are the top 25 trending stocks on reddit for the past 24 hours.  The current time is #{Time.now}."
        TrendingStocks::Stocks.create_stocks_list
        TrendingStocks::Stocks.display_stocks_list
        puts "Which stock would you like to see more details of? Please enter a number from 1-25"
        gets_stock_information
        binding.pry
        

    end

    def gets_stock_information
        @input = gets.strip
        i = @input.to_i
        if (1..TrendingStocks::Stocks.all.length).include?(i)
            i -= 1
            @selected_stock = TrendingStocks::Stocks.all[i]
            TrendingStocks::Stock_details.create_stock_details(@selected_stock)
            TrendingStocks::Stock_ratings.create_stock_ratings(@selected_stock)
            TrendingStocks::Stock_news.create_stock_news(@selected_stock)
        elsif @input == "exit"
            puts "Thanks for using Trending Stocks! Goodbye."
        else
            puts "Please enter a valid number"
            gets_stock_information
        end
    end

/
    welcomes user

scrapes stocks list

displays stock list

asks user to select which stock would like to see details of

user selects stock

scrapes details for selected stock

scrapes stock news for stock

scrapes stock analyst ratings

displays details of stock

asks user to display news, ratings, or start over

user selects

if news then displays news

    asks for ratings or start over

        start over or exit

if ratings then displays ratings

    asks for news or start over

        start over or exit

if start over then clear data and start over
    /
end

