class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy, :reply, :download]
  before_action :set_categories_all, only: [:index, :show, :edit, :new, :create]
  before_action :set_users_all, only: [:create, :index, :incidents_without_tech]
  before_action :set_expiration
  before_action :restrict_access

  def index
    @view_index_all_of_incidents = verifRight('view_index_all_of_incidents')
    if @view_index_all_of_incidents
      @title = 'Liste de tous les incidents'
      @techs = @users.joins(:tech).where('teches.simple_user = false').collect { |p| [[p.surname, p.name].join(' '), p.id] }
      @incidents = Incident.includes(:user, :category, :sous_category).order('created_at desc')
      respond_to do |format|
        format.json { render json: @incidents }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  def incidents_without_tech
    @dispatch_incidents = verifRight('dispatch_incidents')
    if @dispatch_incidents
      @title = "Incidents non attribués"
      @techs = @users.joins(:tech).where('teches.simple_user = false').collect { |p| [[p.surname, p.name].join(' '), p.id] }
      @incidents = Incident.where(tech_id: nil).where.not(incident_state_id_for_tech: [7, 10]).includes(:user, :category, :sous_category).order('created_at desc')
      respond_to do |format|
        format.json { render json: @incidents }
        format.html { render :index }
      end
    else
      renderUnauthorized
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @incident }
      format.html { redirect_to :edit_incident }
    end
  end

  def new
    @create_new_incidents = verifRight('create_new_incidents')
    if @create_new_incidents
      @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
      @incident = Incident.new
      @title = "Créer un incident"
    else
      renderUnauthorized
    end
  end

  def edit
    @view_detail_incident = verifRight('view_detail_incident')
    if @view_detail_incident
      @create_procedure = verifRight('create_procedure')
      @cloture_incidents = verifRight('cloture_incidents')
      @reject_incidents = verifRight('reject_incidents')
      @ask_for_reaffect = verifRight('ask_for_reaffect')
      @response = Response.new
      @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
      @title = "Incident n°#{@incident.id} de #{@incident.user.name} #{@incident.user.surname}"
    else
      renderUnauthorized
    end
  end

  def update_subcats
    @sous_categories = SousCategory.where('category_id = ?',
                                          params[:category_id])
    respond_to do |format|
      format.js
    end
  end

  def send_tech_form
    @dispatch_incidents = verifRight('dispatch_incidents')
    if @dispatch_incidents
      @incident = Incident.find(params[:incident_id])
      @incident.update(tech_id: params[:tech_id])
      unless @incident.tech.ip_addr.nil?
        sendNotif(@incident.tech.ip_addr, "L'incident n°" + @incident.id.to_s + " vient de vous être affecté !")
      end
      respond_to do |format|
        format.js
      end
    else
      renderUnauthorized
    end
  end

  def create
    @create_new_incidents = verifRight('create_new_incidents')
    if @create_new_incidents
      @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
      @incident = Incident.new(incident_params)
      @incident.user_id ||= current_user.id
      @incident.ip_adress ||= request.remote_ip
      @incident.agency_id ||= current_user.agency_id
      respond_to do |format|
        if @incident.save
          unless params[:file_incidents].nil?
            params[:file_incidents]['file'].each do |a|
              @file_incident = @incident.file_incidents.create!(
                incident_id: @incident.id,
                file: a
              )
            end
          end
          @response = Response.new(
            content: "Incident créé par #{current_user.name}
            #{current_user.surname}", incident_id: @incident.id,
            sender_id: @incident.user_id
          )
          @response.save
          format.json { render :show, status: :created, location: @incident }
          format.html { redirect_to edit_incident_path(@incident), notice: "Votre incident a bien été créé." }
          begin
            AppMailer.incident_created_for_creator(@incident, @users).deliver_now
          rescue
            nil
          end
          begin
            AppMailer.incident_created_for_disp(@incident, @users).deliver_now
          rescue
            nil
          end
          User.where(tech_id: 5).each do |disp|
            unless disp.ip_addr.nil?
              sendNotif(disp.ip_addr, @incident.user.name + ' ' + @incident.user.surname + " a créé un incident !")
            end
          end
        else
          format.json { render json: "Impossible de créer l'incident", status: :unprocessable_entity }
          format.html { render :new, notice: "Impossible de créer l'incident, veuillez réessayer" }
        end
      end
    else
      renderUnauthorized
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    @edit_incidents = verifRight('edit_incidents')
    if @edit_incidents
      respond_to do |format|
        if @incident.update(incident_params)
          format.json { render json: "L'incident a bien été mis à jour.", status: :ok }
          format.html { redirect_to :back, notice: "L'incident a bien été mis à jour." }
        else
          format.html { redirect_to :back }
        end
      end
    else
      renderUnauthorized
    end
  end

  def destroy
    @delete_incident = verifRight('delete_incident')
    if @delete_incident
      traitResponse(params[:commit], params[:id])
    else
      renderUnauthorized
    end
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
    params.require(:incident).permit(
      :content, :title, :user_id, :tech_id,
      :category_id, :sous_category_id, :lvl_urgence_user,
      :lvl_urgence_tech, file_incidents_attributes: [:id, :incident_id, :file, :content_type, :file_size]
    )
  end
end
