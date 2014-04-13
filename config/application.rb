require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Registry
  class Application < Rails::Application
    config.generators do |generate|
      generate.helper false
      generate.javascript_engine false
      generate.request_specs false
      generate.routing_specs false
      generate.stylesheets false
      generate.view_specs false
      generate.test_framework :rspec
      generate.fixture_replacement :factory_girl, dir: 'spec/support'
    end
  end
end
