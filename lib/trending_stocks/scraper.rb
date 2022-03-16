class TrendingStocks::Scraper

    def self.trending_stocks_scraper
        trending = Nokogiri::HTML(open("https://www.finder.com/reddit-stocks-to-buy"))
        trending.css("tbody.luna-table__body tr")[0..24].each {|stock|
            ticker = stock.css("td.text-xx-large").text
            full_name = stock.css("td.text-x-large").text
            TrendingStocks::Stocks.new(ticker, full_name)
        }
    end

    def self.stock_details_scraper(selected_stock)
        stock_site = Nokogiri::HTML(open("https://finviz.com/quote.ashx?t=#{selected_stock.ticker}"))
        stock_details_hash = {}
        stock_details_hash[:about] = stock_site.css("td.fullview-profile").text
        stock_details_hash[:sector] = stock_site.css("td.fullview-links a.tab-link")[0].text
        stock_details_hash[:industry] = stock_site.css("td.fullview-links a.tab-link")[1].text
        stock_details_hash[:country] = stock_site.css("td.fullview-links a.tab-link")[2].text
        stock_details_hash[:pe] = stock_site.css("td.snapshot-td2")[1].text
        stock_details_hash[:eps] = stock_site.css("td.snapshot-td2")[2].text
        stock_details_hash[:insider] = stock_site.css("td.snapshot-td2")[3].text
        stock_details_hash[:perf_week] = stock_site.css("td.snapshot-td2")[5].text
        stock_details_hash[:market_cap] = stock_site.css("td.snapshot-td2")[6].text
        stock_details_hash[:forward_pe] = stock_site.css("td.snapshot-td2")[7].text
        stock_details_hash[:insider_trans_6m] = stock_site.css("td.snapshot-td2")[9].text
        stock_details_hash[:perf_mon] = stock_site.css("td.snapshot-td2")[11].text
        stock_details_hash[:income] = stock_site.css("td.snapshot-td2")[12].text
        stock_details_hash[:perf_quart] = stock_site.css("td.snapshot-td2")[17].text
        stock_details_hash[:inst_own] = stock_site.css("td.snapshot-td2")[15].text
        stock_details_hash[:rev] = stock_site.css("td.snapshot-td2")[18].text
        stock_details_hash[:inst_trans_3m] = stock_site.css("td.snapshot-td2")[21].text
        stock_details_hash[:perf_half] = stock_site.css("td.snapshot-td2")[23].text
        stock_details_hash[:target] = stock_site.css("td.snapshot-td2")[28].text
        stock_details_hash[:perf_y] = stock_site.css("td.snapshot-td2")[29].text
        stock_details_hash[:perf_ytd] = stock_site.css("td.snapshot-td2")[35].text
        stock_details_hash[:fiftytwo_range] = stock_site.css("td.snapshot-td2")[34].text
        stock_details_hash[:fiftytwo_h] = stock_site.css("td.snapshot-td2")[40].text
        stock_details_hash[:div_yield] = stock_site.css("td.snapshot-td2")[42].text
        stock_details_hash[:fiftytwo_l] = stock_site.css("td.snapshot-td2")[46].text
        stock_details_hash[:options] = stock_site.css("td.snapshot-td2")[54].text
        stock_details_hash[:rev_growth] = stock_site.css("td.snapshot-td2")[50].text
        stock_details_hash[:ear_growth] = stock_site.css("td.snapshot-td2")[56].text
        stock_details_hash[:rsi] = stock_site.css("td.snapshot-td2")[52].text
        stock_details_hash[:p_close] = stock_site.css("td.snapshot-td2")[59].text
        stock_details_hash[:ear_date] = stock_site.css("td.snapshot-td2")[62].text
        stock_details_hash[:avg_volume] = stock_site.css("td.snapshot-td2")[64].text
        stock_details_hash[:cur_price] = stock_site.css("td.snapshot-td2")[65].text
        stock_details_hash[:recom] = stock_site.css("td.snapshot-td2")[66].text
        stock_details_hash[:sma20] = stock_site.css("td.snapshot-td2")[67].text
        stock_details_hash[:sma50] = stock_site.css("td.snapshot-td2")[68].text
        stock_details_hash[:sma200] = stock_site.css("td.snapshot-td2")[69].text
        stock_details_hash[:cur_volume] = stock_site.css("td.snapshot-td2")[70].text
        stock_details_hash[:cur_change] = stock_site.css("td.snapshot-td2")[71].text
        TrendingStocks::Details.new(stock_details_hash)
    end



end
