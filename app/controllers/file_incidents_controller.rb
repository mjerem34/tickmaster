class FilesIncidentsController < ApplicationController
  def create
    @file = FileIncident.new(incident_id: @incident.id, file: @incident.params[:file])
    @file.save
  end
end
