# agencies_controller.rb
class AgenciesController < ApplicationController
  before_action :set_agency, only: %i(show edit destroy)
  before_action :set_expiration
  before_action :restrict_access

  # GET /agencies
  # GET /agencies.json
  def index
    verify_right('destroy_agencies')
    verify_right('edit_agencies')
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
    @agency = CreateAgency.new(params: params).create
    respond_to do |format|
      if @agency.valid?
        format.js
        format.json { render json: @agency.id, status: :created }
      else
        format.json { render json: @agency.errors.full_messages.first,
                             status: :unprocessable_entity }
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /agencies/1
  # PATCH/PUT /agencies/1.json
  def update
    respond_to do |format|
      if UpdateAgency.new(params: params).update
        format.js
        format.json { head :no_content }
      else
        format.json { render json: nil, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  def destroy
    respond_to do |format|
      if User.where(agency_id: @agency.id).empty?
        if @agency.destroy
          format.json { head :no_content }
          format.html { redirect_to agencies_url, notice: 'Opération réussie' }
        else
          format.json { render json: @agency.errors, status: :unprocessable_entity }
          format.html { render :edit, notice: 'Impossible de supprimer cette agence, allez savoir pourquoi ... Peut être que les employés y sont pour quelque chose ...' }
        end
      else
        format.json { render json: 'Vous ne pouvez pas supprimer cette agence car elle contient des utilisateurs.', status: :unprocessable_entity }
        format.html { redirect_to agencies_url, alert: 'Vous ne pouvez pas supprimer cette agence car elle contient des utilisateurs.' }
      end
    end
  end

  private

  def set_agency
    @agency = Agency.find(params[:id])
  end

  def agency_params
    params[:agency].permit(:name, :ip_adress, :data_agence_comp)
  end
end
