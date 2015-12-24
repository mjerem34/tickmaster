# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( bootstrap-slider.js )
Rails.application.config.assets.precompile += %w( fixedheadertable.js )
Rails.application.config.assets.precompile += %w( jquery.tablesorter.min.js )
Rails.application.config.assets.precompile += %w( jquery.tablesorter.widgets.min.js )
Rails.application.config.assets.precompile += %w( email.css )
Rails.application.config.assets.precompile += %w( nprogress.css )
Rails.application.config.assets.precompile += %w( nprogress.js )
Rails.application.config.assets.precompile += %w( pace.min.js )
Rails.application.config.assets.precompile += %w( pace-theme-fill-left.css )
Rails.application.config.assets.precompile += %w( table-fixed-header.css )
