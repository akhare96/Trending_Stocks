class TrendingStocks::Stock_details

    def initialize(stock_details_hash)
        stock_details_hash.each {|key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        }
    end

end
