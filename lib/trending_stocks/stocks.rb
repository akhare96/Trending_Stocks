class TrendingStocks::Stocks

    attr_accessor :ticker, :full_name, :stock_news, :stock_ratings, :stock_details

    @@all = []

    def initialize(ticker, full_name)
        @ticker = ticker
        @full_name = full_name
    end
end