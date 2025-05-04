source "https://rubygems.org"

gem "bootsnap", require: false
gem "importmap-rails"
gem "jbuilder"
gem "nokogiri", "~> 1.18.7", platforms: [ :ruby ]
gem "pg", "~> 1.1"
gem "puma", ">= 5.0"
gem "rails", "~> 8.0.2"
gem "sprockets-rails"
gem "stimulus-rails"
gem "tailwindcss-rails", "~> 3.0"
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ mingw x64_mingw jruby ]

group :development, :test do
  gem "brakeman"
  gem "debug", platforms: %i[ mri mingw x64_mingw ], require: "debug/prelude"
  gem "factory_bot_rails"
  gem "rspec-rails"
  gem "rubocop-rails-omakase", require: false
  gem "rubocop-rspec", require: false
  gem "solargraph"
end

group :development do
  gem "web-console"
end

group :test do
  gem "cucumber-rails", require: false
  gem "database_cleaner"
end
