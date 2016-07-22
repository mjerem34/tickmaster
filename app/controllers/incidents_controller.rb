class IncidentsController < ApplicationController
  before_action :set_incident, only: [:show, :edit, :update, :destroy, :reply, :download]
  before_action :set_categories_all, only: [:index, :show, :edit, :new, :create]
  before_action :set_users_all, only: [:create, :cloture_it]
  before_action :set_expiration

  def index
    @techs = User.joins(:tech).where('teches.simple_user = false').collect{ |p| [[p.surname, p.name].join(' '), p.id] }
    if params[:order_by].nil?
      @incidents = Incident.includes(:user, :category, :sous_category).order("created_at desc")
    else
      @incidents = Incident.includes(:user, :category, :sous_category).order(params[:order_by])
      respond_to do |format|
        format.js {render action: :order_by}
      end
    end
  end

  def incidents_without_tech
    @techs = User.joins(:tech).where('teches.simple_user = false').collect{ |p| [[p.surname, p.name].join(' '), p.id] }
    if params[:order_by].nil?
      @incidents = Incident.where(tech_id: nil).where.not(incident_state_id_for_tech: [7, 10]).includes(:user, :category, :sous_category).order("created_at desc")
    else
      @incidents = Incident.where(tech_id: nil).where.not(incident_state_id_for_tech: [7, 10]).includes(:user, :category, :sous_category).order(params[:order_by])
      respond_to do |format|
        format.js {render action: :order_by}
      end
    end

  end

  def show
    redirect_to edit_incident_path(@incident)
  end

  def new
    @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
    @incident = Incident.new

  end

  def edit
    @response = Response.new
    @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
  end

  def update_subcats
    @sous_categories = SousCategory.where('category_id = ?',
                                          params[:category_id])
    respond_to do |format|
      format.js
    end
  end
  def send_tech_form
    @incident = Incident.find(params[:incident_id])
    @incident.update(tech_id: params[:tech_id])
    unless @incident.tech.ip_addr.nil?
      sendNotif(@incident.tech.ip_addr, "L'incident n°" + @incident.id.to_s + " vient de vous être affecté !")
    end
    respond_to do |format|
      format.js
    end
  end

  # def procedurer
  #   @incident = Incident.find(params[:id])
  #   @procedure = Procedure.new(nom: @incident.title, contenu: @incident.content,
  #   category_id: @incident.category_id, sous_category_id: @incident.sous_category_id)
  #   Rails.logger.debug { "_______________________________" }
  #   Rails.logger.debug { @procedure.nom }
  #   Rails.logger.debug { "_______________________________" }
  #
  #   respond_to do |format|
  #       format.html { redirect_to :new_procedure}
  #     end
  # end

  def create
    @sous_categories = SousCategory.where('category_id = ?', Category.first.id)
    @incident = Incident.new(incident_params)
    @incident.user_id ||= current_user.id
    @incident.ip_adress ||= request.remote_ip
    # @incident.incident_state_id_for_user_id ||= 1
    # @incident.incident_state_id_for_tech_id ||= 1
    # @incident.lvl_urgence_tech = 1
    # @incident.lvl_of_incident = 1
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
          sender_id: @incident.user_id)
        @response.save
        format.html { redirect_to edit_incident_path(@incident), notice: "Votre incident a bien été créé." }
        format.json { render :show, status: :created, location: @incident }
        AppMailer.incident_created_for_creator(@incident, @users).deliver_now
        AppMailer.incident_created_for_disp(@incident, @users).deliver_now
        User.where(tech_id: 5).each do |disp|
          unless disp.ip_addr.nil?
            sendNotif(disp.ip_addr, @incident.user.name + " " + @incident.user.surname + " a créé un incident !")
          end
        end
      else
        format.html { render :new, notice: "Veuillez réessayer" }
      end
    end
  end

  # PATCH/PUT /incidents/1
  # PATCH/PUT /incidents/1.json
  def update
    respond_to do |format|
      if @incident.update(incident_params)
        format.html { redirect_to :back, notice: "L'incident a bien été mis à jour." }
        format.json { render :show, status: :ok, location: @incident }
      else
        format.html { redirect_to :back }
      end
    end
  end

  def destroy
    @incident.destroy
    respond_to do |format|
      format.html { redirect_to incidents_url, notice: "Vous venez de supprimer un incidents." }
      format.json { head :no_content }
    end
  end

  def download
    send_file "#{Rails.root}/public/uploads/incidents/#{@incident.file_incidents.id}/#{@incident.file_incidents.identifier}"
  end

  private

  def set_expiration
    expires_in(10.seconds, public: true)
  end

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
      :lvl_urgence_tech, file_incidents_attributes: [:id, :incident_id, :file, :content_type, :file_size])
  end
end
