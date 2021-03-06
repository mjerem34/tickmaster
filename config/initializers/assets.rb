# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
Rails.application.config.assets.precompile += %w[email.css]
Rails.application.config.assets.precompile += %w[nprogress.css]
Rails.application.config.assets.precompile += %w[table-fixed-header.css]
Rails.application.config.assets.precompile += %w[pace-theme-fill-left.css]
Rails.application.config.assets.precompile += %w[*.js]
Rails.application.config.assets.precompile += %w[*.min.js]
# Rails.application.config.assets.precompile += %w( *.js *.png *.jpg *.jpeg *.gif *.woff *.ttf *.svg *.eot *.css *.scss *.coffee )
