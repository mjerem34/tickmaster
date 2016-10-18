class FieldAgenciesController < ApplicationController
  before_action :set_field_agency, only: [:show, :edit, :update, :destroy]

  # GET /field_agencies
  # GET /field_agencies.json
  def index
    @field_agencies = FieldAgency.all
  end

  # GET /field_agencies/1
  # GET /field_agencies/1.json
  def show
  end

  # GET /field_agencies/new
  def new
    @field_agency = FieldAgency.new
  end

  # GET /field_agencies/1/edit
  def edit
  end

  # POST /field_agencies
  # POST /field_agencies.json
  def create
    @field_agency = FieldAgency.new(field_agency_params)

    respond_to do |format|
      if @field_agency.save
        format.html { redirect_to @field_agency, notice: 'Field agency was successfully created.' }
        format.json { render :show, status: :created, location: @field_agency }
      else
        format.html { render :new }
        format.json { render json: @field_agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /field_agencies/1
  # PATCH/PUT /field_agencies/1.json
  def update
    respond_to do |format|
      if @field_agency.update(field_agency_params)
        format.html { redirect_to @field_agency, notice: 'Field agency was successfully updated.' }
        format.json { render :show, status: :ok, location: @field_agency }
      else
        format.html { render :edit }
        format.json { render json: @field_agency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /field_agencies/1
  # DELETE /field_agencies/1.json
  def destroy
    @field_agency.destroy
    respond_to do |format|
      format.html { redirect_to field_agencies_url, notice: 'Field agency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_field_agency
      @field_agency = FieldAgency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def field_agency_params
      params.require(:field_agency).permit(:name)
    end
end
