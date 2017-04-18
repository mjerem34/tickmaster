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
    config.web_console.development_only = false
    config.i18n.default_locale = :fr
    config.generators do |g|
      g.test_framework :rspec,
      :fixtures => true,
      :view_specs => false,
      :helper_specs => false,
      :routing_specs => true,
      :controller_specs => true,
      :request_specs => true
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end
  end

end
