source 'https://rubygems.org'

ruby '2.1.2'
gem 'rails', '4.0.0'

gem 'activeadmin', github: 'gregbell/active_admin'
gem 'devise'
gem 'exception_notification', '~> 4.0.1'
gem 'heroku', '~> 2.24.0'
gem 'jquery-rails'
gem 'mysql2'
gem 'pg'
#gem 'recurring_select'
#gem 'recurring_select', github: 'dam/recurring_select', branch: 'add_hourly_and_minutely_rules'
gem 'simple_form', '~> 3.0.0'
gem 'simple-navigation', '~> 3.11.0'
gem 'turbolinks'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 4.0.0' # Use SCSS for stylesheets
  gem 'coffee-rails', '~> 4.0.0' # Use CoffeeScript for .js.coffee assets and views
  gem 'susy'
  gem 'compass', '>= 0.12.2'
  gem 'compass-rails', '>= 1.0.3'
  #gem 'fancy-buttons'
  #gem 'font-awesome-rails'
  gem 'uglifier', '>= 1.3.0' # Use Uglifier as compressor for JavaScript assets
end

group :production do
  gem 'rails_12factor'
end

group :development do
  gem 'factory_girl_rails' # needed in dev group for fixture replacement
  gem 'awesome_print'
  gem 'interactive_editor'
  gem 'annotate', '~> 2.6.0'
end

group :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'capybara-webkit'
  #gem 'selenium-webdriver'
  gem 'database_cleaner', '~> 1.2.0'
  gem 'simplecov', '~> 0.8.2'
  gem 'coveralls', require: false
end
