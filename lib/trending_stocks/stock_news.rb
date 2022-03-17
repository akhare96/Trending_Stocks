class TrendingStocks::Stock_news

    attr_accessor :title, :time, :url

    def initialize(title, time, url)
        @title = title
        @time = time
        @url = url
    end

end