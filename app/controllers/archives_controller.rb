class ArchivesController < ApplicationController


  def index
    @archives = Archive.all
  end

  def show
    @archive = Archive.find(params[:id])
  end

  def new
    @archive = Archive.new
  end

  def download
    send_file "#{Rails.root}/public/uploads/archives/#{@incident.file_incidents.id}/#{@incident.file_incidents.identifier}"
  end

  private

end
