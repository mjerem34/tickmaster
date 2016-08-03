class PagesController < ApplicationController
  before_action :set_expiration
  def home
    redirect_to new_session_path if current_user.nil?
    redirect_to current_user unless current_user.nil?
  end

  def teches
    @title = 'Techniciens'
  end

  def incidents
    @title = "Tickets d'incidents"
  end
end
