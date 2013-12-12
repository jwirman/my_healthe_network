source 'https://rubygems.org'

ruby '2.0.0'
gem 'rails', '4.0.0'

gem 'activeadmin', github: 'gregbell/active_admin'
gem "devise"
gem "exception_notification", "~> 4.0.1"
gem 'heroku', '~> 2.24.0'
gem 'jquery-rails'
gem 'mysql2'
gem 'pg'
gem "simple_form", "~> 3.0.0"
gem "simple-navigation", "~> 3.11.0"


# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

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

# needed in dev group for fixture replacement
gem 'factory_girl_rails'

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem 'capybara'
  gem 'capybara-webkit'
  #gem 'selenium-webdriver'
  gem "database_cleaner", "~> 1.2.0"
end
