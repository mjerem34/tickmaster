# detentor_types_controller.rb
class DetentorTypesController < ApplicationController
  
  before_action :restrict_access

  # GET /detentor_types
  # GET /detentor_types.json
  def index
    @detentor_types = DetentorType.all
    respond_to do |format|
      format.json { render json: @detentor_types }
      format.html { render :index }
    end
  end
end
