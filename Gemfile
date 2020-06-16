source 'https://rubygems.org'

ruby '2.2.3'
gem 'rabl'
gem 'oj'
gem 'versioncake', '~> 3.1', '>= 3.1.0'


## We're extending the 1.3 version of Solidus.
# To work directly agains that version do:
# `git clone -b v1.3.0 git@github.com:solidusio/solidus.git solidus`
# Comment in the line below 
#gem 'solidus', path:  '/Users/martins/Work/Hoome/solidus', ref: 'c0bcd30e0'
gem 'solidus', github: 'solidusio/solidus' , branch: 'c0bcd30e0'

gem 'solidus_auth_devise', '>= 1.6.0'
gem 'deface', '>= 1.0.2'

gem 'quiet_assets', '>= 1.1.0', group: :development

gem 'aws-sdk', '~> 1.5.7' # Amazon Web Sevices for attachments (Must be at this version for paperclip support, not v2)
gem 'dotenv-rails', '>= 2.1.0', groups: [:development, :test]

gem 'puma'

gem 'cancancan', '~> 1.10'

group :test do
  gem 'factory_girl_rails', '~> 4.5.0'
  gem 'capybara', '~> 2.6', '>= 2.6.2'
  gem 'capybara-screenshot', '>= 1.0.11'
  gem 'database_cleaner', '~> 1.3'
  gem 'email_spec'
  gem 'launchy'
  gem 'rspec-activemodel-mocks', '~>1.0.2'
  gem 'rspec-collection_matchers'
  gem 'rspec-its'
  gem 'rspec-rails', '~> 3.5.0'
  gem 'simplecov'
  gem 'webmock', '1.8.11'
  gem 'poltergeist', '>= 1.9.0'
  gem 'timecop'
  gem 'with_model'
  gem 'rspec_junit_formatter'
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.0.0'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0', '>= 5.0.5'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.1'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '>= 4.4.0'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '>= 2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.3', '>= 2.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :development, :test do
  gem 'rubocop'
  gem 'spring-commands-rspec'
  gem 'guard-rspec', require: false
end

# And on non Mac systems run bundle install --without darwin (this only needs to be run once, the without setting
# is remembered for future bundle installs).
# Then for Heroku run heroku config:add BUNDLE_WITHOUT="development test darwin"
# From http://www.johnplummer.com/rails/heroku-error-conditional-rbfsevent-gem.html
group :darwin, :test do
  gem 'rb-fsevent'
end

group :production do
  gem 'exception_notification', '>= 4.2.0'
  gem 'rails_12factor'
end
