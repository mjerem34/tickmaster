Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.log_level = :debug
  config.assets.debug = true
  config.active_support.deprecation = :notify
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { host: '10.134.2.250' }
  config.serve_static_files = false
  config.i18n.fallbacks = true
  config.active_record.dump_schema_after_migration = false
  config.assets.digest = true

  config.middleware.use ExceptionNotification::Rack,
                        email: {
                          email_prefix: '[Website Error] ',
                          sender_address: 'ticket@cle-expertises.fr',
                          exception_recipients: ['jeremy.montesinos@cle-expertises.fr']
                        }
  config.log_formatter = ::Logger::Formatter.new
  config.logger = Logger.new(STDOUT)
end
