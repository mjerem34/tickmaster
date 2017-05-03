class DetentorTypesController < ApplicationController
  before_action :set_expiration
  before_action :restrict_access

  # GET /detentor_types
  # GET /detentor_types.json
  def index
    @index_detentor_types = verify_right('index_detentor_types')
    if @index_detentor_types
      @title = 'Types de détenteurs'
      @detentor_types = DetentorType.all
      respond_to do |format|
        format.json { render json: @detentor_types }
        format.html { render :index }
      end
    else
      permission_denied
    end
  end
end
