# Load the Rails application.
require File.expand_path('../application', __FILE__)
ActionMailer::Base.default :content_type => "text/html"
# Initialize the Rails application.
Rails.application.initialize!
