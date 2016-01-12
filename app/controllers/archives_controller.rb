class ArchivesController < ApplicationController
  before_action :set_expiration

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

  def set_expiration
    expires_in(100.years, public: true)
  end
end
