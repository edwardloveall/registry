require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'
require 'capybara/rspec'
require 'monban/test/helpers'

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!
Monban.test_mode!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.include FactoryGirl::Syntax::Methods
  config.include Monban::Test::Helpers, type: :feature
  config.include Monban::Test::ControllerHelpers, type: :controller
  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false
  config.order = "random"

  config.before :each do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.after :each do
    Monban.test_reset!
  end
end
