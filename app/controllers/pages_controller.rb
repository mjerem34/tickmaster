class PagesController < ApplicationController
  def home
  end

  def teches
    @title = "Techniciens"
  end
  def incidents
    @title = "Tickets d'incidents"
  end

end
