class ResponsesController < ApplicationController
  before_action :set_expiration
  before_action :restrict_access
  # GET /responses/new
  def new
    @title = "Nouvelle réponse"
    @incident = Incident.find(params[:incident_id])
    @response = Response.new
  end

  # POST /responses
  # POST /responses.json
  def create
    traitResponse(params[:commit], params[:incident_id])
  end

  def download
    send_file "#{Rails.root}/public/uploads/responses/#{@response.file_responses.id}/#{@response.file_responses.identifier}"
  end

  private

  # Never trust parameters from the scary internet, only allow the white list through.
  def response_params
    params.require(:response).permit(:content, file_responses_attributes: [:id, :response_id, :file, :content_type, :file_size])
  end
end
