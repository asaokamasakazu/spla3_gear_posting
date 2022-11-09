require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Spla3GearPosting
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.generators do |g|  # ここから追記
      g.skip_routes false
      g.test_framework :rspec,
        controller_specs: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
    end

    config.i18n.default_locale = :ja

    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }

    config.time_zone = "Tokyo"
  end
end
