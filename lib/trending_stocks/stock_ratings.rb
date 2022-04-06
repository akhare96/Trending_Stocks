class TrendingStocks::Stock_ratings
    
    attr_accessor :rates

    @@ratings = []

    def initialize(rates)
        @rates = rates
        save
    end

    def save
        self.class.ratings << self
    end

    def self.ratings
        @@ratings
    end

    def self.create_stock_ratings(selected_stock)
        TrendingStocks::Scraper.stock_analyst_scraper(selected_stock)
        selected_stock.ratings = self.ratings[0]
    end

    def self.display_stock_ratings(user_stock)
        if user_stock.ratings.rates == ""
            puts "There are no analysts ratings for this stock/ETF currently."
        else
            puts user_stock.ratings.rates
        end
    end

end