source 'https://rubygems.org'
ruby '2.1.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use sqlite3 as the database for Active Record
group  :development, :test do
  gem 'sqlite3', '1.3.7'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'json'
gem 'kaminari'
gem 'dalli'
gem 'whenever'
gem 'simple_form'
group :development, :test do
  gem 'rspec-rails', '3.0.0.beta1'
  gem 'rake_shared_context'
  gem 'capybara', '~> 2.2.1'
  gem 'selenium-webdriver'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'database_rewinder'
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', require: false
  gem 'brakeman'
  gem 'rails_best_practices'
  gem 'rubocop', '~> 0.23',  require: false
  # gem 'rubocop', '~> 0.19',  require: false
  gem 'rubocop-checkstyle_formatter', require: false
  gem 'guard'
  gem 'guard-rspec', '~> 0.4.2'
  gem 'guard-spring'
  gem 'guard-rubocop'
  gem 'terminal-notifier-guard'
  gem 'parallel_tests'
end
gem 'spring' , '1.1.2'

group :development, :test do
  gem 'pry-rails'
  #  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'awesome_print'
  gem 'better_errors'
end

group :production do
  gem 'pg'
  gem 'foreman'
  gem 'rails_12factor'
  gem 'bugsnag'
  # アプリケーションサーバ
  gem 'puma'
end

# 本番
gem 'heroku'

# model info
gem 'annotate', :git =>'https://github.com/ctran/annotate_models'

# td
gem 'td'
gem 'td-logger'

# newrelic
gem 'newrelic_rpm'

# todo list generates
gem 'watson-ruby'

# setting
gem 'settingslogic'

# bower
gem 'bower-rails', '~> 0.7.1'

# cache_digest
gem 'cache_digests'

# itunes api
gem 'itunes-search-api'

# API versio管理
gem 'versioncake'

# youtub api
gem 'youtube_it'

# css fremework compass
gem 'compass-rails'

# decorator
gem 'active_decorator'

# 画像アップロード
gem 'carrierwave'
gem 'rmagick'
gem 'cloudinary'

# travis ci対応?
group :test do
  gem 'byebug'
  gem 'nio4r', '0.5.0'
  gem 'rake-compiler'
end
