# frozen_string_literal: true

require_relative "./trending_stocks/version"
require_relative "./trending_stocks/scraper"
require_relative "./trending_stocks/stock_details"
require_relative "./trending_stocks/stock_ratings"
require_relative "./trending_stocks/stock_news"
require_relative "./trending_stocks/stocks"
require_relative "./trending_stocks/cli"

require 'pry'
require 'nokogiri'
require 'open-uri'
require 'terminal-table'
require 'colorize'


module TrendingStocks
  class Error < StandardError; end
  # Your code goes here...
end
