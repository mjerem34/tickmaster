# agencies_controller.rb
class AgenciesController < ApplicationController
  before_action :set_agency, only: %i(show edit destroy)
  before_action :set_expiration
  before_action :restrict_access

  # GET /agencies
  # GET /agencies.json
  # Must render all the agencies if they have the authorization.
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
  # Must exec the method to do the ping and get the result to return it.
  def do_ping
    value = exec_ping(params[:host])
    render json: value
  end

  # GET /agencies/1
  # GET /agencies/1.json
  # Must render one agency.
  def show
    respond_to do |format|
      format.json { render json: @agency }
      format.html { redirect_to edit_agency_url(@agency) }
    end
  end

  # GET /agencies/new
  # This should render the page for create an agency.
  def new
    @agency = Agency.new
    @field_agencies = FieldAgency.all
  end

  # GET /agencies/1/edit
  # Should get the agency and render the edit form.
  def edit
    @field_agencies = FieldAgency.all
  end

  # POST /agencies
  # POST /agencies.json
  # Should create a new agency, it used for the rest service.
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
  # Should used for the rest service for update an agency.
  # It get an agency by his id.
  def update
    UpdateAgency.new(params: params).update
    respond_to do |format|
      format.js
      format.json { head :no_content }
    end
  end

  # DELETE /agencies/1
  # DELETE /agencies/1.json
  # Should destroy an agency by the id passed in params.
  # Maybe do a test if there are nobody in her.
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

  # Use callbacks to share common setup or constraints between actions.

  def set_agency
    @agency = Agency.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def agency_params
    params[:agency].permit(:name, :ip_adress, :data_agence_comp)
  end
end
