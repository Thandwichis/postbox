require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
module Postbox
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.time_zone = 'EST' # Or any other default timezone

    # Configuration for the application, engines, and railties goes here.
    #
    config.active_job.queue_adapter = :sidekiq

    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    config.active_job.queue_adapter = :sidekiq
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
