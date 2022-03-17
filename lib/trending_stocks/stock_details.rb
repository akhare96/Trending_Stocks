class TrendingStocks::Stock_details

    def initialize(stock_details_hash)
        stock_details_hash.each {|key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        }
    end

    def self.create_stock_details(selected_stock)
        deets = TrendingStocks::Scraper.stock_details_scraper(selected_stock)
        selected_stock.details = deets
    end

end
