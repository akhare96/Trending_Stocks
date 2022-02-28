# frozen_string_literal: true

require_relative "lib/trending_stocks/version"

Gem::Specification.new do |spec|
  spec.name          = "trending_stocks"
  spec.version       = TrendingStocks::VERSION
  spec.authors       = ["Ambar Khare"]
  spec.email         = ["ambar.khare24@gmail.com"]

  spec.summary       = "Finds the 20 most talked about stocks on tiwtter and displays details on the selected stock"
  spec.description   = "Finformer.com keeps track of the 20 most talked about stocks on twitter.  This gem scrapes that list at time of execution and proceeds to display the stocks.
                        the user can either compare two stocks or select a stock for further details/news (scraped from yahoo finance)."
  spec.homepage      = "www.bob.com"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.4.0"

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "www.bob.com"
  spec.metadata["changelog_uri"] = "www.bob.com"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
