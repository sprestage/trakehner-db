source 'https://rubygems.org'
# Specify ruby version for Heroku deploy
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.2'
gem 'pg'
gem 'devise'
gem 'omniauth'

# Use coveralls to display code coverage percentage badge on readme
gem 'coveralls', require: false

# Use Pundit for authorization (policies and roles)
gem 'pundit'

# Use Kaminari for pagination
gem 'kaminari'

# Use SCSS for stylesheets
gem 'sass-rails'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'

# Make Minitest generally available for Heroku deploy
gem 'minitest-rails'

# File uploading
gem "carrierwave"
# File uploading, Amazon S3 - not currently using this gem.  We should
#  further consider if we want to implement direct to S3 uploading or not.
gem "carrierwave_direct"

# Background processing tasks
gem "sidekiq"

# Image manipulation (resizing)
gem "rmagick"

# Cloud and Amazon S3 access
gem "fog"

# Sending mail
gem 'mail'
gem 'postmark'

# unf helps fog properly encode AWS strings that contain non-standard
# characters, per https://github.com/fog/fog/pull/2320
gem "unf"

gem "simple_form"

group :production do
  gem 'rails_12factor'
  gem 'newrelic_rpm'
end

group :development, :test do
# More minitest
  gem 'minitest'
  gem 'minitest-focus'
  gem 'minitest-colorize'
# Capybara
  gem 'minitest-rails-capybara'
  gem 'launchy'
# pry inline debugger
  gem 'pry-rails'
  gem 'pry-debugger'
  gem 'pry-doc'
# Faker for generating /test/fixture/foo.yml data
  gem 'faker'
# Figaro for removing secret keys from github
  gem 'figaro'
end

group :test do
  gem 'turn'
  gem 'simplecov', :require => false, :group => :test
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use ActiveModel has_secure_password
gem 'bcrypt-ruby'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
