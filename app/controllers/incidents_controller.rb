# incidents_controller.rb
class IncidentsController < ApplicationController
  before_action :set_incident, only: %i[show edit update cloture reject]
  before_action :set_categories_all, only: %i[index show edit new create]
  before_action :set_users_all, only: %i[create index without_tech]
  before_action :set_expiration
  before_action :restrict_access

  # GET /incidents
  # GET /incidents.json
  def index
    @techs = @users.joins(:type_user).where('type_users.is_tech = true')
                   .collect { |p| [[p.surname, p.name].join(' '), p.id] }
    @incidents = Incident.all
    respond_to do |format|
      format.json { render json: @incidents }
      format.html { render :index }
    end
  end

  # GET /incidents/1
  # GET /incidents/1.json
  def show
    render json: @incident
  end

  # GET /incidents/new
  def new
    @sous_categories = Category.first.sous_categories
    @incident = Incident.new
  end

  # GET /incidents/1/edit
  def edit
    @response = Response.new
    @sous_categories = Category.first.sous_categories
  end

  # POST /incidents
  # POST /incidents.json
  def create
    @incident = CreateIncident.new(params: incident_params).call
    respond_to do |format|
      if @incident.persisted?
        format.json { render json: @incident.id, status: 201 }
        format.html { redirect_to root_path, notice: 'Création réussie !' }
      else
        format.json { render json: @incident.errors.full_messages, status: 422 }
        format.html { render :new, notice: @incident.errors.full_messages }
      end
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    respond_to do |format|
      if @incident.update(incident_params)
        format.json { head :no_content }
        format.html { redirect_to :back, notice: 'Mise à jour réussie !' }
      else
        format.html { redirect_to :back }
      end
    end
  end

  # DELETE /incidents/1/cloture.json
  def cloture
    @cloture = ClotureIncident.new(incident: @incident,
                                   current_user: current_user,
                                   ip_address: request.remote_ip).call
    render json: @cloture.result, status: @cloture.status
  end

  # DELETE /incidents/1/reject.json
  def reject
    @reject = RejectIncident.new(incident: @incident,
                                 current_user: current_user,
                                 ip_address: request.remote_ip).call
    render json: @reject.result, status: @reject.status
  end

  private

  def set_categories_all
    @categories = Category.all
  end

  def set_incident
    @incident = Incident.find(params[:id])
  end

  def set_users_all
    @users = User.all
  end

  def incident_params
    params.require(:incident).permit(:content, :title, :tech_id,
                                     :category_id, :sous_category_id,
                                     :lvl_urgence_user, :lvl_urgence_tech,
                                     :incident_state_id_for_user_id,
                                     :incident_state_id_for_tech_id)
    params[:incident][:user_id] = current_user.id
    params[:incident][:ip_address] = request.remote_ip
    params[:incident].permit!
  end
end
