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

    def self.display_stock_details(user_stock)
        puts "The stock you selected is #{user_stock.ticker} - #{user_stock.full_name}.\n\n"
        puts "||  #{user_stock.details.sector}  ||  #{user_stock.details.industry}  ||  #{user_stock.details.country}  ||\n\n"
        puts "Summary"
        puts "------\n"
        puts "#{user_stock.details.about}\n\n"

        table = Terminal::Table.new {|t|
        t << ["Price", user_stock.details.cur_price, "Previous Close", user_stock.details.p_close, "52 Week Range", user_stock.details.fiftytwo_range, "52 Week Low", user_stock.details.fiftytwo_l, "52 Week High", user_stock.details.fiftytwo_h]
        t << ["Performance Today", user_stock.details.cur_change, "Performance Week", user_stock.details.perf_week, "Performance Month", user_stock.details.perf_mon, "Performance Quarter", user_stock.details.perf_quart, "Performance Half-Year", user_stock.details.perf_half]
        t << ["Performance Year", user_stock.details.perf_y, "Performance YTD", user_stock.details.perf_ytd, "Volume", user_stock.details.cur_volume, "Average Volume(3mo)", user_stock.details.avg_volume, "Income", user_stock.details.income]
        t << ["Market Cap", user_stock.details.market_cap, "EPS", user_stock.details.eps, "Quarterly Earnings Growth (YoY)", user_stock.details.ear_growth, "Revenue", user_stock.details.rev, "Quarterly Revenue Growth (YoY)", user_stock.details.rev_growth]
        t << ["P/E", user_stock.details.pe, "Forward P/E", user_stock.details.forward_pe, "Dividend Yield", user_stock.details.div_yield, "Options", user_stock.details.options, "Earnings Date", user_stock.details.ear_date]
        t << ["Insider Ownership", user_stock.details.insider, "Insider Transaction", user_stock.details.insider_trans_6m, "Institution Ownership", user_stock.details.inst_own, "Institution Transaction", user_stock.details.inst_trans_3m, "RSI (14)", user_stock.details.rsi]
        t << ["SMA20", user_stock.details.sma20, "SMA50", user_stock.details.sma50, "SMA200", user_stock.details.sma200, "Analyst Rate 1-BUY 5-SELL", user_stock.details.recom, "Analyst Target Price", user_stock.details.target]
        t.style = {:all_separators => true}
        } 
        puts table
    end
end
