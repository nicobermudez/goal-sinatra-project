source 'http://rubygems.org'

gem 'sinatra'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'activesupport'
gem 'rack-flash3'
gem 'rake', '~> 12.3', '>= 12.3.2'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'tux'
gem 'rack-flash3'
gem 'sinatra-flash'
gem 'bcrypt'

group :test do
  gem 'launchy'
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

group :development  do
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'activerecord-postgresql-adapter'
end
