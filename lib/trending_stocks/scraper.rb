class TrendingStocks::Scraper

    def self.trending_stocks_scraper
        trending = Nokogiri::HTML(open("https://www.finder.com/reddit-stocks-to-buy"))
        trending.css("tbody.luna-table__body tr")[0..24].each {|stock|
            ticker = stock.css("td.text-xx-large").text
            full_name = stock.css("td.text-x-large").text
            TrendingStocks::Stocks.new(ticker, full_name)
        }
    end


end
