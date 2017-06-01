# application_controller.rb
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  include ApplicationHelper

  private

  # Should signout the user on browser's close
  def set_expiration
    expires_in(10.seconds, public: true)
  end
end
