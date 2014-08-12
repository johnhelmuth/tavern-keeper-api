source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
gem 'rack-cors', :require => 'rack/cors'
gem 'grape'
gem 'grape-entity'
gem 'will_paginate'

# Use postgresql as the database for Active Record
gem 'pg'

# Background Workers
gem 'sidekiq', "~> 2.17"
gem 'sidetiq'
gem 'sinatra', '>= 1.3.0', :require => nil

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# API/SDK
gem 'aws-sdk-core'
gem 'google-api-client', require: 'google/api_client'
gem 'rest-client'

# Support Gems
gem 'tavern-keeper-dice', git: 'git@github.com:TavernKeeper/tavern-keeper-dice.git'
gem 'tavern-keeper-scrubber', git: 'git@github.com:TavernKeeper/tavern-keeper-scrubber.git'

# Use unicorn as the app server
gem 'unicorn'

group :development, :test do
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'simplecov', :require => false
  gem 'autotest-standalone'
  gem 'rspec-rails'
end
