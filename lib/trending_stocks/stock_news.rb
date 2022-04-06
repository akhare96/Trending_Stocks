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

    def self.create_stock_news(selected_stock)
        TrendingStocks::Scraper.stock_news_scraper(selected_stock)
        selected_stock.news = self.all_news
    end

    def self.display_stock_news(user_stock)
        puts "\n"
        puts "Here are the latest headlines for #{user_stock.ticker.colorize(:blue)}"
        puts "\n\n"
        user_stock.news.each {|stock|
        puts "#{stock.time.colorize(:yellow)}\n----------------- \n#{stock.title}\n#{stock.url.colorize(:blue)}"
        puts "\n\n"
        }
    end

end