class TrendingStocks::Stock_details

    @@all_details = []

    def initialize(stock_details_hash)
        stock_details_hash.each {|key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value)
        }
        save
    end

    def save
        self.class.all_details << self
    end

    def self.all_details
        @@all_details
    end

    def self.create_stock_details(selected_stock)
        TrendingStocks::Scraper.stock_details_scraper(selected_stock)
        selected_stock.details = self.all_details[0]
    end

    def self.display_stock_details(user_stock)
        puts "The stock you selected is #{user_stock.ticker.colorize(:blue)} - #{user_stock.full_name.colorize(:blue)}.\n\n"
        puts "||  #{user_stock.details.sector.colorize(:blue)}  ||  #{user_stock.details.industry.colorize(:blue)}  ||  #{user_stock.details.country.colorize(:blue)}  ||\n\n"
        puts "Summary".colorize(:blue)
        puts "-------\n"
        puts "#{user_stock.details.about}\n\n"

        table = Terminal::Table.new {|t|
        t << ["Price".colorize(:blue), user_stock.details.cur_price, "Previous Close".colorize(:blue), user_stock.details.p_close, "52 Week Range".colorize(:blue), user_stock.details.fiftytwo_range, "52 Week Low".colorize(:blue), user_stock.details.fiftytwo_l, "52 Week High".colorize(:blue), user_stock.details.fiftytwo_h]
        t << ["Performance Today".colorize(:blue), user_stock.details.cur_change, "Performance Week".colorize(:blue), user_stock.details.perf_week, "Performance Month".colorize(:blue), user_stock.details.perf_mon, "Performance Quarter".colorize(:blue), user_stock.details.perf_quart, "Performance Half-Year".colorize(:blue), user_stock.details.perf_half]
        t << ["Performance Year".colorize(:blue), user_stock.details.perf_y, "Performance YTD".colorize(:blue), user_stock.details.perf_ytd, "Volume".colorize(:blue), user_stock.details.cur_volume, "Average Volume(3mo)".colorize(:blue), user_stock.details.avg_volume, "Income".colorize(:blue), user_stock.details.income]
        t << ["Market Cap".colorize(:blue), user_stock.details.market_cap, "EPS".colorize(:blue), user_stock.details.eps, "Quarterly Earnings Growth (YoY)".colorize(:blue), user_stock.details.ear_growth, "Revenue".colorize(:blue), user_stock.details.rev, "Quarterly Revenue Growth (YoY)".colorize(:blue), user_stock.details.rev_growth]
        t << ["P/E".colorize(:blue), user_stock.details.pe, "Forward P/E".colorize(:blue), user_stock.details.forward_pe, "Dividend Yield".colorize(:blue), user_stock.details.div_yield, "Options".colorize(:blue), user_stock.details.options, "Earnings Date".colorize(:blue), user_stock.details.ear_date]
        t << ["Insider Ownership".colorize(:blue), user_stock.details.insider, "Insider Transaction".colorize(:blue), user_stock.details.insider_trans_6m, "Institution Ownership".colorize(:blue), user_stock.details.inst_own, "Institution Transaction".colorize(:blue), user_stock.details.inst_trans_3m, "RSI (14)".colorize(:blue), user_stock.details.rsi]
        t << ["SMA20".colorize(:blue), user_stock.details.sma20, "SMA50".colorize(:blue), user_stock.details.sma50, "SMA200".colorize(:blue), user_stock.details.sma200, "Analyst Avg Score 1-BUY 5-SELL".colorize(:blue), user_stock.details.recom, "Analyst Avg Target Price".colorize(:blue), user_stock.details.target]
        t.style = {:all_separators => true}
        } 
        puts table
    end
end
