source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'bcrypt', '~> 3.1.7'
gem 'fast_jsonapi'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'city-state'
gem 'figaro'
gem 'faraday'
gem 'travis'
gem 'rack-cors'
gem 'sendgrid-ruby'
gem 'twilio-ruby'
gem 'sidekiq'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'pry'
  gem 'shoulda-matchers'
  gem 'nyan-cat-formatter'
  gem 'launchy'
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'activerecord-reset-pk-sequence'
  gem 'simplecov'
end

group :development do
  gem 'listen', '~> 3.2'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
