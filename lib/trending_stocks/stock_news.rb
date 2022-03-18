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
        latest_news = TrendingStocks::Scraper.stock_news_scraper(selected_stock)
        selected_stock.news = self.all_news
    end

    def self.display_stock_news(user_stock)
        table = Terminal::Table.new {|t|
            user_stock.news.each {|stock|
                t << [stock.time, "#{stock.title}\n#{stock.url.colorize(:blue)}"]
            }
            t.style = {:all_separators => true}
            t.title = "Latest 25 Headlines for #{user_stock.ticker}"
            t.align_column(0, :right)
        }
        puts table
    end

end