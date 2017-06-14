# field_agencies_controller.rb
class FieldAgenciesController < ApplicationController
  before_action :set_field_agency, only: %i[update destroy]

  before_action :restrict_access
  before_action :agency_binded?, only: :destroy

  # GET /field_agencies
  # GET /field_agencies.json
  def index
    @field_agencies = FieldAgency.all
    respond_to do |format|
      format.json { render json: @field_agencies }
      format.html { render :index }
    end
  end

  # POST /field_agencies.json
  def create
    @field_agency = FieldAgency.new(field_agency_params)
    if @field_agency.save
      render json: @field_agency.id, status: :created
    else
      render json: @field_agency.errors.full_messages, status: 422
    end
  end

  # PUT /field_agencies/1.json
  def update
    if @field_agency.update(field_agency_params)
      render json: nil, status: 204
    else
      render json: @field_agency.errors.full_messages, status: 422
    end
  end

  # DELETE /field_agencies/1.json
  def destroy
    if @field_agency.destroy
      render json: nil, status: 204
    else
      render json: @field_agency.errors.full_messages, status: 422
    end
  end

  private

  def agency_binded?
    render json: 'Une agence est liée', status: 422 if @field_agency
                                                       .field_agency_agencies
                                                       .exists?
  end

  def set_field_agency
    @field_agency = FieldAgency.find(params[:id])
  end

  def field_agency_params
    params.require(:field_agency).permit(:name)
  end
end
