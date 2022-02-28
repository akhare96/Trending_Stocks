# frozen_string_literal: true

require_relative "./trending_stocks/version"
require_relative "./trending_stocks/cli"

require 'pry'
require 'nokogiri'
require 'open-uri'


module TrendingStocks
  class Error < StandardError; end
  # Your code goes here...
end
