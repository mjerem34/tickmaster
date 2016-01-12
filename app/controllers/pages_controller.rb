class PagesController < ApplicationController
  before_action :set_expiration

  def home
  end

  def teches
    @title = 'Techniciens'
  end

  def incidents
    @title = "Tickets d'incidents"
  end

  private

  def set_expiration
    expires_in(100.years, public: true)
  end
end
