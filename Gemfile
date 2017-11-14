source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.6'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# easier controller responses
gem 'responders'
# css normalization
gem 'normalize-rails'
# fake data for seeds
gem 'faker', git: 'https://github.com/stympy/faker'
# Cool font icons
gem 'font-awesome-rails'
# use twitter api
gem 'twitter'
# parse tweet text and autogenerate relevant links
gem 'twitter-text'
# dotenv configuration
gem 'dotenv-rails'
# watson API
gem 'apollo-bot'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Make tests auto-run when changing files
  gem 'guard'
  gem 'guard-livereload', '2.3.0', require: false
  gem 'guard-minitest'
end

group :test do
  gem 'simplecov', require: false                   # generate test coverage reports
end

group :development do
  gem 'better_errors'                               # better error pages
  gem 'rubocop'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  # route analysis and cleaning
  gem 'traceroute'
  # profile page loading and display load time analysis
  gem 'rack-mini-profiler'
  # find n+1 queries
  gem 'bullet', '<= 4.5.0' # due to using activerecord 2.x
  # find common security vulnerabilities
  gem 'brakeman', require: false
end

group :production do
  gem 'rails_12factor'
end
