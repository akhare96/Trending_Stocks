# frozen_string_literal: true

require_relative "lib/trending_stocks/version"

Gem::Specification.new do |spec|
  spec.name          = "trending_stocks"
  spec.version       = TrendingStocks::VERSION
  spec.authors       = ["Ambar Khare"]
  spec.email         = ["ambar.khare24@gmail.com"]

  spec.summary       = "Finds the 25 most talked about stocks on reddit and displays details on the selected stock"
  spec.description   = "finder.com/reddit-stocks-to-buy keeps track of the most talked about stocks on twitter.  This gem scrapes that list at time of execution and proceeds to display the stocks.
                        The user can select a stock to see more details along with analyst ratings and 20 lates news headlines."
  #spec.homepage      = "www.bob.com"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  #spec.metadata["homepage_uri"] = spec.homepage
  #spec.metadata["source_code_uri"] = "www.bob.com"
  #spec.metadata["changelog_uri"] = "www.bob.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]


  # spec.add_dependency "example-gem", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "open-uri"
  spec.add_development_dependency "terminal-table"
  spec.add_development_dependency "colorize"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
