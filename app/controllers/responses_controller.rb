class ResponsesController < ApplicationController
  before_action :set_expiration

  # GET /responses
  # GET /responses.json
  def index
    @responses = Response.all
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
    @response = Response.find(params[:id])
  end

  # GET /responses/new
  def new
    @incident = Incident.find(params[:incident_id])
    @response = Response.new
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  # POST /responses.json
  def create
    @users = User.all
    @incident = Incident.find(params[:incident_id])
    @response = @incident.responses.new(response_params)
    case params[:commit]
    when 'Rejeter' then
      @response.content = 'Incident rejeté : ' + @response.content
    when 'Réaffecter' then
      @response.content = 'Demande de réaffectation envoyée : ' + @response.content
    when 'Cloturer' then
      @response.content = "Cloture de l'incident : " + @response.content
    end
    @response.sender_id = current_user.id
    @response.ip_adress_sender ||= request.remote_ip
    if @response.sender_id == @incident.tech_id
      @incident.update(notify_for_tech: false, notify_for_user: true)
      @response.receiver_id = @incident.user_id
    else
      if params[:commit] != 'Rejeter' && params[:commit] != 'Cloturer'
        @incident.update(notify_for_tech: true, notify_for_user: false)
      else
        @incident.update(notify_for_tech: false, notify_for_user: false)
      end
      @response.receiver_id = @incident.tech_id
    end

    if @response.save!
      unless params[:file_responses].nil?
        params[:file_responses]['file'].each do |a|
          # if a.size > 31_457_280
          # flash[:notice] = 'Doit être inférieur à 30 Mo'
          flash[:notice] = 'Doit être inférieur à 5 Mo' if a.size > 5_242_880
          @file_responses = @response.file_responses.create(
            response_id: @response.id,
            file: a
          )
        end
      end
      case params[:commit]
      when 'Valider' then
        if @response.receiver.nil?
          User.where(tech_id: 5).each do |disp|
            unless disp.ip_addr.nil?
              sendNotif(disp.ip_addr, @response.sender.name + ' ' + @response.sender.surname + " a envoyé un message !")
            end
          end
        else
          unless @response.receiver.ip_addr.nil?
            sendNotif(@response.receiver.ip_addr, @response.sender.name + ' ' + @response.sender.surname + " a envoyé un message !")
          end
        end
        if @response.sender_id == @incident.user_id
          unless @incident.incident_state_id_for_user_id == 1
            @incident.update(incident_state_id_for_user_id: 6, incident_state_id_for_tech_id: 4)
          end
        elsif @response.sender_id == @incident.tech_id
          unless @incident.incident_state_id_for_user_id == 1
            @incident.update(incident_state_id_for_user_id: 4, incident_state_id_for_tech_id: 5)
          end
        end
        if @users.where(id: @response.sender_id).pluck(:tech_id).join == '5'
          @response.receiver_id.nil? ? nil : AppMailer.incident_replied_for_tech_if_disp_answered(@incident, @users, @response).deliver_now
          AppMailer.incident_replied_for_creator_if_disp_answered(@incident, @users, @response).deliver_now
          AppMailer.incident_replied_for_disp_if_disp_answered(@incident, @users, @response).deliver_now
        else
          AppMailer.incident_replied_for_sender(@incident, @users, @response).deliver_now
          @response.receiver_id.nil? ? nil : AppMailer.incident_replied_for_receiver(@incident, @users, @response).deliver_now
          AppMailer.incident_replied_for_disp(@incident, @users, @response).deliver_now
        end
        flash[:notice] = "Votre message a bien été envoyé."
        redirect_to edit_incident_path(@incident)
      when 'Rejeter' then
        reject_it(@incident)
        AppMailer.incident_rejected_for_creator(@incident, @users).deliver_now
        AppMailer.incident_rejected_for_disp(@incident, @users).deliver_now
        User.where(tech_id: 5).each do |disp|
          unless disp.ip_addr.nil?
            sendNotif(disp.ip_addr, "L'incident n°" + @incident.id.to_s + " a été rejeté !")
          end
        end
        unless @incident.user.ip_addr.nil?
          sendNotif(@incident.user.ip_addr, "Votre incident n°" + @incident.id.to_s + " a été rejeté !")
        end

        flash[:notice] = "Votre demande de rejet a bien été prise en compte."
        redirect_to edit_incident_path(@incident)
      when 'Réaffecter' then
        reaffect_it(@incident)
        AppMailer.incident_reaffected_for_tech(@incident, @users).deliver_now
        AppMailer.incident_reaffected_for_disp(@incident, @users).deliver_now
        User.where(tech_id: 5).each do |disp|
          unless disp.ip_addr.nil?
            sendNotif(disp.ip_addr, "L'incident n°" + @incident.id.to_s + " demande a être réaffecté !")
          end
        end

        flash[:notice] = "Votre demande de réaffectation a bien été prise en compte."
        redirect_to edit_incident_path(@incident)
      when 'Cloturer' then
        cloture_it(@incident)
      end
    else
      redirect_to edit_incident_path(@incident)
      end
    end
  end

# PATCH/PUT /responses/1
# PATCH/PUT /responses/1.json
def update
  respond_to do |format|
    if @response.update(response_params)
      format.html { redirect_to @response }
      format.json { render :show, status: :ok, location: @response }
    else
      format.html { render :edit }
      format.json { render json: @response.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /responses/1
# DELETE /responses/1.json

def destroy
  @response.destroy
  respond_to do |format|
    format.html { redirect_to responses_url }
    format.json { head :no_content }
  end
end

def download
  send_file "#{Rails.root}/public/uploads/responses/#{@response.file_responses.id}/#{@response.file_responses.identifier}"
end

  private

def reject_it(incident)
  # Met a jour les params de l'incident pour indiquer qu'il est cloture
  incident.update(incident_state_id_for_tech_id: 10)
  incident.update(incident_state_id_for_user_id: 10)
  @responses = Response.all.where(incident_id: incident.id) # Recupere toutes les reponses de l'incident
  @responses.each do |response| # Pour chaque response
    @archive = Archive.new( # cree une nouvelle archive
      content: response.content,
      incident_id: response.incident_id,
      sender_id: response.sender_id,
      receiver_id: response.receiver_id,
      ip_adress_sender: response.ip_adress_sender,
      pc_id: response.pc_id
    )
    next if response.file_responses.nil?
    response.file_responses.each do |a| # Alors pour chaque fichier
      @file_archives = FileArchive.new( # Creer un fichier archive identique a l'ancien dans la table file_archives
        archive_id: response.id,
        file: a.file
      )
      if @file_archives.save! # Si fichier sauvegarde
        a.destroy # Detruit l'ancien
      else
        flash[:notice] = "Une erreur est apparue lors de l'archivage des fichiers de l'incident.
        Merci de contacter votre administrateur en lui fournissant ces informations :
        #{@file_archives.inspect} ------ #{response.inspect} ------ #{incident.inspect}"
        redirect_to_back
      end
    end

    if @archive.save! # Si ok
      response.destroy # et supprime l'ancienne reponse
    else
      flash[:notice] = "Une erreur est apparue lors de l'archivage de l'incident.
      Merci de contacter votre administrateur en lui fournissant ces informations :
      #{@file_archives.inspect} ------ #{response.inspect} ------ #{incident.inspect}"
      redirect_to_back
    end
  end
end

def cloture_it(incident)
  @users = User.all # Recuperation de tous les users pour email
  @responses = Response.all.where(incident_id: incident.id) # Recuperation toutes les reponses de lincident
  if incident.user_id == current_user.id # Si celui qui cloture est celui qui a cree lincident
    unless incident.tech.ip_addr == ''
      sendNotif(incident.tech.ip_addr, "L'incident n°" + incident.id.to_s + " a été cloturé !")
    end
    incident.update(
      resolved_at: Time.now, archived_at: Time.now,
      incident_state_id_for_tech_id: 7,
      incident_state_id_for_user_id: 7
    )

    @responses.each do |response| # Pour chaque reponse
      @archive = Archive.new( # Creer une archive avec contenu identique
        content: response.content,
        incident_id: response.incident_id,
        sender_id: response.sender_id,
        receiver_id: response.receiver_id,
        ip_adress_sender: response.ip_adress_sender,
        pc_id: response.pc_id
      )
      next if response.file_responses.nil?
      response.file_responses.each do |a| # Alors pour chaque fichier
        @file_archives = FileArchive.new( # Creer un fichier archive identique a l'ancien dans la table file_archives
          archive_id: response.id,
          file: a.file
        )
        if @file_archives.save! # Si fichier sauvegarde
          a.destroy # Detruit l'ancien
        else
          redirect_to_back
        end
      end
      if @archive.save! # Si reponse archivee sauvegardee
        response.destroy! # Destruction de l'ancienne
      else redirect_to incidents_path
      end
    end

  elsif incident.tech_id == current_user.id # Sinon si celui qui cloture est le technicien en charge
    unless incident.user.ip_addr.nil?
      sendNotif(incident.user.ip_addr, "Votre incident n°" + incident.id.to_s + " demande à être cloturé !")
    end

    incident.update( # Met a jour l'incident : en attente de cloture
      resolved_at: Time.now, incident_state_id_for_tech_id: 9,
      incident_state_id_for_user_id: 8
    )
    @response.save!
    AppMailer.incident_clotured_for_creator_if_is_tech_clotured(incident, @users, @responses).deliver_now
    AppMailer.incident_clotured_for_tech_if_is_tech_clotured(incident, @users).deliver_now
    AppMailer.incident_clotured_for_disp_if_is_tech_clotured(incident, @users).deliver_now
  end
  redirect_to current_user
end

def reaffect_it(incident) # fait repasser lincident a l'etat en attente daffectation
  incident.update(incident_state_id_for_tech_id: 1)
  incident.update(incident_state_id_for_user_id: 1)
end

def set_expiration
  expires_in(10.seconds, public: true)
end

# Never trust parameters from the scary internet, only allow the white list through.
def response_params
  params.require(:response).permit(:content, file_responses_attributes: [:id, :response_id, :file, :content_type, :file_size])
end
