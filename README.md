Rails application for the Elgin Technology Center

Contributors: James Stubblefield

# Initial Setup of app

## Step 1

ETC_APP uses PostgreSQL, so you will need to make sure this is set up on your local machine by installing the gem.  You will need to use a version of PostgreSQL greater than 8.4.

    gem install pg

You will then need to create and migrate your database.

    $  rake db:create
    $  rake db:migrate

## Step 2

This app uses the following environment variables.

    ENV["SECRET_TOKEN"]
    ENV["DEVISE_SECRET_KEY"]
    ENV["DEVISE_PEPPER"]
    ENV["S3_BUCKET"]
    ENV["S3_ACCESS_KEY"]
    ENV["S3_SECRET_ACCESS_KEY"]
    ENV["MANDRILL_USERNAME"] # Only for production
    ENV["MANDRILL_API_KEY"] # Only for production
    ENV["WEB_CONCURRENCY"] = "1" # Unicorn - Set 1 for DEVELOPMENT, 3 PRODUCTION
    ENV["MC_API_KEY"] # API key for Mailchimp to add users to mail list.
    ENV["MC_CURRENT_USER_LIST_ID"] # Mailchimp list ID that members will be added to.

You will need to make sure these are set up locally or your app will throw errors.

You can generate a secret token for rails by running the following command.  Store that token as `ENV["SECRET_TOKEN"]`.

    $  rake secret

Repeat that same step two more times to get unique keys for `ENV["DEVISE_SECRET_KEY"]` and `ENV["DEVISE_PEPPER"]`.

This application is set up to scale Heroku background workers in staging and production using the workless gem, so you should add the following environment variables on those servers:

    heroku config:add HEROKU_API_KEY=yourapikey APP_NAME=yourherokuappname
    heroku config:add WORKLESS_MAX_WORKERS=2
    heroku config:add WORKLESS_MIN_WORKERS=0
    heroku config:add WORKLESS_WORKERS_RATIO=50

Find more info about using the workless gem [here](https://github.com/lostboy/workless).

## Step 3

You will need to create your first user through console with the following commands.  Make sure your password is at least 8 characters long.

    $  rails c
    u = User.new
    u.email = "your@email.com"
    u.password = "your_password"
    u.password_confirmation = "your_password"
    u.membership_type = "premier"
    u.member_since = 48.hours.ago
    u.first_name = "Jane"
    u.last_name = "Doe"
    u.admin = true
    u.save

This will create your user account and assign you as admin so you can use those functions.  All other users can be added by console or through the app by using the `users/invitation/new` path.  The app is set up to use [devise_invitable gem](https://github.com/scambra/devise_invitable).

## Sitemap
You will need to modify `config/sitemap.rb` to your domain.

You can create a sitemap and send the updated info to Google and Bing by running the following rake task:

    $    rake sitemap:refresh

To issue a sitemap without pinging Google and Bing:

    $    rake sitemap:refresh:no_ping

## Testing
This app is set up to run tests using RSpec.  You can run the tests using the following command:

    $    rake test:prepare
    $    rspec

