Rails.application.configure do
  config.cache_classes = true
  config.eager_load = true
  config.serve_static_files = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.logger = Logger.new(STDOUT)
  config.middleware.use ExceptionNotification::Rack,
                        email: {
                          email_prefix: '[Website Error] ',
                          sender_address: 'ticket@cle-expertises.fr',
                          exception_recipients: ['jeremy.montesinos@cle-expertises.fr']
                        }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.smtp_settings = {
    address: 'auth.smtp.1and1.fr',
    port: '587',
    user_name: 'ticket@cle-expertises.fr',
    password: 'sonya88',
    authentication: :plain,
    enable_starttls_auto: true
  }
  config.action_mailer.default_url_options = { host: '10.134.2.250' }
  config.assets.compile = false
  config.assets.digest = true
  config.serve_static_files = true
  config.log_level = :debug
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false
end
