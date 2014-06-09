# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'rspec/autorun'
require 'factory_girl'
require 'capybara/rspec'
require 'selenium-webdriver'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

# ajaxの通信などで待ちが発生する場合の最大待ち時間
Capybara.default_wait_time = 30

# seleniumを使う
Capybara.default_driver = :selenium

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.before :suite do
    FactoryGirl.reload
    DatabaseRewinder.clean_all
  end

  config.after :each do
    DatabaseRewinder.clean
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.use_transactional_fixtures = true

  config.infer_base_class_for_anonymous_controllers = false
  
  config.include Capybara::DSL

  config.order = "random"
end
