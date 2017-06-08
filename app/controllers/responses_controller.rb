# response_controller.rb
class ResponsesController < ApplicationController
  before_action :restrict_access
  before_action :set_response
  before_action :set_incident_state
  # POST /responses
  # POST /responses.json
  def create
    if @response.save
      render json: @response.created_at
        .strftime('%d-%m-%Y %H:%M:%S'), status: 201
    else
      render json: @response.errors.full_messages, status: 422
    end
  end

  private

  def response_params
    params.require(:response).permit(:content, :incident_id)
    params[:response][:sender_id] = current_user.id
    params[:response][:ip_address_sender] = request.remote_ip
    params[:response].permit!
  end

  def set_response
    @response = Response.new(response_params)
  end

  def set_incident_state
    if @response.sender == @response.incident.user
      @response.incident.incident_state_id_for_user_id = 6
      @response.incident.incident_state_id_for_tech_id = 4
    elsif @response.sender == @response.incident.tech
      @response.incident.incident_state_id_for_user_id = 4
      @response.incident.incident_state_id_for_tech_id = 5
    end
    @response.incident.save!
  end
end
