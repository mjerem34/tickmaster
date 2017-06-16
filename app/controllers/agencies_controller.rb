# agencies_controller.rb
class AgenciesController < ApplicationController
  before_action :set_agency, only: %i[show edit destroy]

  before_action :restrict_access
  before_action :agency_empty?, only: :destroy
  respond_to :json

  # GET /agencies
  # GET /agencies.json
  def index
    @agencies = Agency.order('name asc')
    respond_to do |format|
      format.json { render json: @agencies }
      format.html { render :index }
    end
  end

  # GET /agencies/ping
  def ping
    @agencies = Agency.all
    respond_to do |format|
      format.html { render :ping }
    end
  end

  # GET /agencies/do_ping
  def do_ping
    value = exec_ping(params[:host])
    render json: value
  end

  # GET /agencies/1
  # GET /agencies/1.json
  def show
    respond_to do |format|
      format.json { render json: @agency }
      format.html { redirect_to edit_agency_url(@agency) }
    end
  end

  # GET /agencies/new
  def new
    @agency = Agency.new
    @field_agencies = FieldAgency.all
  end

  # GET /agencies/1/edit
  def edit
    @field_agencies = FieldAgency.all
  end

  # POST /agencies
  # POST /agencies.json
  def create
    @agency = Agency.new(name: params[:agency][:name],
                         ip_address: params[:agency][:ip_address])
    if @agency.save
      render json: @agency.id, status: 201
    else
      render json: @agency.errors.full_messages, status: 422
    end
  end

  # PATCH/PUT /agencies/1
  # PATCH/PUT /agencies/1.json
  def update
    if UpdateAgency.new(id: params[:id], params: agency_params).call
      render json: nil, status: 200
    else
      render json: nil, status: 422
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  def destroy
    respond_to do |format|
      @agency.destroy
      format.json { head :no_content }
      format.html { redirect_to agencies_url, notice: 'Opération réussie' }
    end
  end

  private

  def agency_empty?
    render json: "L'agence contient des utilisateurs", status: 422 if @agency
                                                                      .users
                                                                      .exists?
  end

  def set_agency
    @agency = Agency.find(params[:id])
  end

  def agency_params
    agency_params = params.require(:agency)
                          .permit(:name, :ip_address)
    agency_params[:data_agence_comp] = params[:agency][:data_agence_comp]
    agency_params.permit!
  end
end
