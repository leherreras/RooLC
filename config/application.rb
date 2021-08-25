# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RooLC
  # Root config for owr applications
  class Application < Rails::Application
    # Initialize configuration duser_spec.rbefaults for originally generated Rails version.
    config.load_defaults 6.1

    config.generators do |g|
      g.factory_bot false
    end

    config.middleware.use Rack::Cors do
      allow do
        origins '*'
        resource '*',
                 headers: :any,
                 expose: %w[access-token expiry token-type uid client],
                 methods: %i[get post options delete put]
      end
    end
  end
end
