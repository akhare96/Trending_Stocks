
class TrendingStocks::CLI

    def call
        @input = ""
        puts "Welcome to Trending Stocks! Here are the top 25 trending stocks on reddit for the past 24 hours.  The current time is #{Time.now}.  Enter 'exit' anytime during the program to exit."
        TrendingStocks::Stocks.create_stocks_list
        TrendingStocks::Stocks.display_stocks_list
        puts "Which stock would you like to see more details of? Please enter a number from 1-25"
        gets_stock_information
        TrendingStocks::Stock_details.display_stock_details(@selected_stock)
        puts "For news, type 'news'.  For analysts ratings type 'ratings'.  If you would like to select another stock type 'next'"
        user_choice
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
        elsif
            puts "Please enter a valid number"
            gets_stock_information
        else
            goodbye
        end
    end

    def user_choice
        @input = gets.strip
        if @input == "news"
            TrendingStocks::Stock_news.display_stock_news(@selected_stock)
            puts "If you would like to see ratings type 'ratings' or 'next' to select another stock."
            user_chose_news_first
        elsif @input == "ratings"
            TrendingStocks::Stock_ratings.display_stock_ratings(@selected_stock)
            puts "If you would like to see latest news type 'news' or 'next' to select another stock."
            user_chose_ratings_first
        elsif @input == "next"
            user_chose_next
        else
            goodbye
        end
    end

    def user_chose_news_first
    end

    def user_chose_ratings_first
    end

    def user_chose_next
    end

    def goodbye
    end

end