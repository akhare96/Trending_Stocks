
class TrendingStocks::CLI


    def call
        puts "Welcome to Trending Stocks! Here are the top 25 trending stocks on reddit for the past 24 hours:"
        TrendingStocks::Stocks.create_stocks_list
        binding.pry
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

