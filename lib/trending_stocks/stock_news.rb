class TrendingStocks::Stock_news

    attr_accessor :title, :time, :url

    @@all_news = []

    def initialize(title, time, url)
        @title = title
        @time = time
        @url = url
        save
    end

    def save
        self.class.all_news << self
    end

    def self.all_news
        @@all_news
    end


end