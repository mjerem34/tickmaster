# response_controller.rb
class ResponsesController < ApplicationController
  before_action :set_expiration
  before_action :restrict_access

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(response_params)
    if @response.save
      render json: @response.created_at, status: 201
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
end
