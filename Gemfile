source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.4'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman', :require => false
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :assets do
  gem 'sass-rails', '~> 4.0.2'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
end

gem 'jquery-rails'
gem 'turbolinks'

# Front end framework
gem 'foundation-rails', '~> 5.2.1'

# User authentication
gem 'devise'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby