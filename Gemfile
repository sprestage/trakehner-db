source 'https://rubygems.org'
# Specify ruby version for Heroku deploy
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0'
gem 'pg'
gem 'devise'
gem 'omniauth'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

# Make Minitest generally available for Heroku deploy
gem 'minitest-rails'

group :production do
  gem 'rails_12factor'
end

group :development, :test do
# More minitest
  gem 'minitest', '> 4.0'
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
