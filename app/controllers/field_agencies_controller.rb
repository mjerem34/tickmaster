class FieldAgenciesController < ApplicationController
  before_action :set_field_agency, only: %i[update destroy]
  before_action :set_expiration
  before_action :restrict_access

  # GET /field_agencies
  # GET /field_agencies.json
  def index
    @index_field_agencies = verify_right('index_field_agencies')
    if @index_field_agencies
      @title = 'Champs agences'
      @field_agencies = FieldAgency.all
      respond_to do |format|
        format.json { render json: @field_agencies }
        format.html { render :index }
      end
    else
      permission_denied
    end
  end

  # POST /field_agencies.json
  def create
    @create_field_agencies = verify_right('create_field_agencies')
    if @create_field_agencies
      @title = "Création d'un champ d'agence"
      respond_to do |format|
        @field_agency = FieldAgency.new(field_agency_params)
        if @field_agency.save
          format.js
          format.json { render json: @field_agency.id, status: :created }
        else
          format.json do
            render json: @field_agency.errors.full_messages.first,
                   status: :unprocessable_entity
          end
        end
      end
    end
  end

  # PUT /field_agencies/1.json
  def update
    @update_field_agencies = verify_right('update_field_agencies')
    if @update_field_agencies
      @title = "Edition d'un champ d'agence"
      respond_to do |format|
        if @field_agency.update(field_agency_params)
          format.js
          format.json { head :no_content }
        else
          format.json do
            render json: @field_agency.errors.full_messages.first,
                   status: :unprocessable_entity
          end
        end
      end
    else
      permission_denied
    end
  end

  # DELETE /field_agencies/1.json
  def destroy
    @destroy_field_agencies = verify_right('destroy_field_agencies')
    if @destroy_field_agencies
      @title = "Suppression d'un champ d'agence"
      respond_to do |format|
        if @field_agency.field_agency_agencies.none?
          if @field_agency.destroy
            format.js
            format.json { head :no_content }
          else
            format.json do
              render json: @field_agency.errors.full_messages.first,
                     status: :unprocessable_entity
            end
          end
        else
          format.json do
            render json: 'Impossible de supprimer le champ car il contient'\
            ' des données associées',
                   status: :unprocessable_entity
          end
        end
      end
    else
      permission_denied
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_field_agency
    @field_agency = FieldAgency.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white
  # list through.
  def field_agency_params
    params.require(:field_agency).permit(:name)
  end
end
