class TrendingStocks::Stock_ratings
    
    attr_accessor :ratings

    def initialize(ratings)
        @ratings = ratings
    end

    def create_stock_ratings(selected_stock)
        analysts = TrendingStocks::Scraper.stock_analyst_scraper(selected_stock)
        selected_stock.ratings = analysts
    end

end