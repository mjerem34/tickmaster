require File.expand_path('../boot', __FILE__)
require 'rails/all'
require 'carrierwave'
Bundler.require(*Rails.groups)
module Tickets
  class Application < Rails::Application
    config.action_mailer.smtp_settings = {
      address: 'auth.smtp.1and1.fr',
      port: '587',
      user_name: 'ticket@cle-expertises.fr',
      password: 'sonya88',
      authentication: :plain,
      enable_starttls_auto: true
    }
    config.action_mailer.default_url_options = { host: '10.134.2.250' }
    config.time_zone = 'Europe/Paris'
    config.filter_parameters += [:password]
    config.active_record.raise_in_transactional_callbacks = true
    config.web_console.whiny_requests = false
  end
end
