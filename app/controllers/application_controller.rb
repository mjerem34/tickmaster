class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  def reject_it(incident)
    # Met a jour les params de l'incident pour indiquer qu'il est cloture
    incident.update(incident_state_id_for_tech: 10)
    incident.update(incident_state_id_for_user: 10)
    @responses = Response.all.where(incident_id: incident.id) # Recupere toutes les reponses de l'incident
    @responses.each do |response| # Pour chaque response
      @archive = Archive.new( # cree une nouvelle archive
        content: response.content,
        incident_id: response.incident_id,
        sender_id: response.sender_id,
        receiver_id: response.receiver_id,
        ip_adress_sender: response.ip_adress_sender,
        pc_id: response.pc_id)
      if @archive.save! # Si ok
        response.destroy # et supprime l'ancienne reponse
      else
        redirect_to_back
      end
    end
  end

  def reaffect_it(incident) # fait repasser lincident a l'etat en attente daffectation
    incident.update(incident_state_id_for_tech: 1)
    incident.update(incident_state_id_for_user: 1)
  end

  def redirect_to_back(default = '/')
    if !request.env['HTTP_REFERER'].blank? && request.env['HTTP_REFERER'] != request.env['REQUEST_URI']
      redirect_to :back
    else
      redirect_to default
    end
  end

  def cloture_it(incident)
    @users = User.all # Recuperation de tous les users pour email
    @responses = Response.all.where(incident_id: incident.id) # Recuperation toutes les reponses de lincident
    if incident.user_id == current_user.id # Si celui qui cloture est celui qui a cree lincident
      incident.update(
        resolved_at: Time.now, archived_at: Time.now,
        incident_state_id_for_tech: 7,
        incident_state_id_for_user: 7)

      @responses.each do |response| # Pour chaque reponse
        @archive = Archive.new( # Creer une archive avec contenu identique
          id: response.id,
          content: response.content,
          incident_id: response.incident_id,
          sender_id: response.sender_id,
          receiver_id: response.receiver_id,
          ip_adress_sender: response.ip_adress_sender,
          pc_id: response.pc_id)
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
      # AppMailer.incident_clotured_for_creator_if_is_creator_clotured(incident, @users, @responses).deliver_now
      # AppMailer.incident_clotured_for_tech_if_is_creator_clotured(incident, @users).deliver_now unless incident.tech_id.nil?
      # AppMailer.incident_clotured_for_disp_if_is_creator_clotured(incident, @users).deliver_now unless User.where(tech_id: 5).nil?
    elsif incident.tech_id == current_user.id # Sinon si celui qui cloture est le technicien en charge
      incident.update( # Met a jour l'incident : en attente de cloture
        resolved_at: Time.now, incident_state_id_for_tech: 9,
        incident_state_id_for_user: 8)
      @response = Response.new(
        content: "Demande de cloture envoyée par #{current_user.name}
        #{current_user.surname}",
        incident_id: incident.id, sender_id: incident.user_id) # MODIFIER POUR QUE SENDER_ID SOIT incident.TECH_ID ET RECEIVER_ID SOIT incident.USER_ID
      @response.save!
      AppMailer.incident_clotured_for_creator_if_is_tech_clotured(incident, @users, @responses).deliver_now
      AppMailer.incident_clotured_for_tech_if_is_tech_clotured(incident, @users).deliver_now
      AppMailer.incident_clotured_for_disp_if_is_tech_clotured(incident, @users).deliver_now
    end
    redirect_to incidents_path
  end
end
