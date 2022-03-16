class TrendingStocks::Stocks

    attr_accessor :ticker, :full_name, :stock_news, :stock_ratings, :stock_details

    @@all = []

    def initialize(ticker, full_name)
        @ticker = ticker
        @full_name = full_name
        save
    end

    def save
        self.class.all << self

    def self.all
        @@all
    end

    def self.create_stocks_list
        TrendingStocks::Scraper.trending_stocks_scraper
    end

end