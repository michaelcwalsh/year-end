source 'https://rubygems.org/'
ruby '2.3.1'

gem 'rails', '~> 5'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'listen'
gem 'devise'
gem 'foundation-rails'
gem 'carrierwave'
gem 'fog-aws'
gem 'httparty'

group :development, :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'pry-rails'
  gem 'shoulda'
  gem 'valid_attribute'
  gem 'dotenv-rails'
end

group :test do
  gem 'launchy', require: false
  gem 'coveralls', require: false
  gem 'database_cleaner'
end

group :production do
  gem 'rails_12factor', group: :production
end
