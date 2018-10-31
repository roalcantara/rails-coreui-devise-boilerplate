# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Factual
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Do not generate specs for views and requests. Also, do not generate assets
    config.generators do |g|
      g.template_engine = :slim
      g.helper false
      g.view_specs false
      g.assets false
      g.integration_tool false
    end

    config.app_generators do |g|
      g.test_framework :rspec
    end

    # Settings in config/environments/* take precedence over those
    # specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Prevent initializing your application and connect to the database
    # on assets precompile.
    config.assets.initialize_on_precompile = false
  end
end
