source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.5'

gem 'rails', '~> 5.2.3'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'fast_jsonapi', '~> 1.5'
gem 'ransack', '~> 2.1.1'
gem 'rack-cors', '~> 1.0.3'

group :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers', git: 'https://github.com/thoughtbot/shoulda-matchers.git', branch: 'rails-5'
  gem 'simplecov', require: false
end

group :development, :test do
  gem 'pry'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'pry-highlight'
  gem 'listen'
end

group :development do
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rails_best_practices'
end
