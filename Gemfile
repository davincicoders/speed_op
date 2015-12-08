source 'https://rubygems.org'

gem "highcharts-rails", "~> 3.0.0"
# gem 'will_paginate'

gem 'omniauth-github'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'omniauth-linkedin'
gem 'omniauth-google-oauth2'
gem 'google-api-client', '0.9.pre3'
gem 'cancancan'
gem 'json'
gem 'omniauth', '~> 1.2.2'
gem 'lunchy'

gem 'resque', '~> 1.25', '>= 1.25.2', require: 'resque/server'
gem 'resque-scheduler', '~> 4.0', :require => 'resque/scheduler/server'
gem 'resque_mailer'
gem 'mailcatcher'


gem 'mail_form'
gem 'simple_form'
gem 'whenever', :require => false

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'

require 'rubygems'

group :production do
  gem 'rails_12factor'
end

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
gem 'bootstrap-generators'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem "figaro"

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails'
  gem 'guard-rspec', require: false
  gem 'guard-bundler'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'faker'
  gem 'shoulda-matchers'
  gem 'quiet_assets'
  gem 'launchy'
  gem 'thin'
  gem 'dotenv-rails'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  gem 'foreman'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development, :test, :production do
  gem 'pg'
end
