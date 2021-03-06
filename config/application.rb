require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GOLEMS
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    ActionMailer::Base.smtp_settings = {
        :address  => 'smtp.gmail.com',
        :domain => 'mail.google.com',
        :port => 587,
        :user_name  => "glazedoverceramics.demo@gmail.com",
        :password => "defaultpassword",
        :authentication => 'login',
        :enable_starttls_auto => true
    }

    config.serve_static_assets = false

    config.time_zone = 'Central Time (US & Canada)'
    config.active_record.default_timezone = :local

  end
end
