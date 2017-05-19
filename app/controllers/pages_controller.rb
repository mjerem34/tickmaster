# pages_controller.rb
class PagesController < ApplicationController
  before_action :set_expiration

  def home
    if current_user.nil?
      redirect_to new_session_path
    else
      redirect_to current_user
    end
  end

  def teches
    @title = 'Techniciens'
  end

  def incidents
    @title = "Tickets d'incidents"
  end
end
