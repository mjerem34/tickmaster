class DetentorTypesController < ApplicationController
  before_action :set_expiration
  before_action :restrict_access

  # GET /detentor_types
  # GET /detentor_types.json
  def index
    @view_detentor_type = verifRight('view_detentor_type')
    if @view_detentor_type
      @title = 'Types de détenteurs'
      @detentor_types = DetentorType.all
      respond_to do |format|
        format.json { render json: @detentor_types }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end
end
