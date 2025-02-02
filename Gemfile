source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.5'

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
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'brakeman', :require => false
  gem 'byebug'
  gem 'thin'
  # Hide assets in logs
  gem 'quiet_assets'

end

group :production, :staging do
  gem 'rails_12factor'
end

group :assets do
  gem 'sass-rails', '~> 4.0.3'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
end

gem 'haml'

# Using pg for dev and production
gem 'pg'

# Used for full-text search in pg
gem 'pg_search'

gem 'jquery-rails'
# gem 'turbolinks'

# Front end framework
gem 'foundation-rails', '~> 5.2.1'

# Font Awesome
gem 'font-awesome-rails'

# User authentication
gem 'devise', '~> 3.2.1'

# user invitation through Devise
gem 'devise_invitable', '~> 1.3.4'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Tagging for user profile skills
gem 'acts-as-taggable-on', '~> 3.1.1'

# Pagination
gem 'kaminari', git: 'https://github.com/jameswilliamiii/kaminari.git'

# File uploads
gem 'paperclip', github: 'thoughtbot/paperclip'

# Storage through Amazon S3
gem 'aws-sdk', '~> 1.5.7'
gem 'aws'

# Preview emails
gem "mail_view", "~> 2.0.4"

gem 'unicorn'

gem 'newrelic_rpm'

# Create sitemaps using rake tasks
gem 'sitemap_generator'

# Add users to mailchimp
gem 'mailchimp'

# Delayed jobs
gem 'delayed_job_active_record', '~> 4.0.0'

# Scale up worker dynos on Heroku when delayed_jobs are present
gem 'workless', '~>1.2.3'

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