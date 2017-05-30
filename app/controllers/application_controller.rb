# application_controller.rb
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  include ApplicationHelper

  private

  # Must signout the user when he close the navigator.
  def set_expiration
    expires_in(10.seconds, public: true)
  end

  # Must treat the response to the incident.
  def traitResponse(_commit, incident_id)
    @users = User.all
    @incident = Incident.find(incident_id)
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
    @response.ip_address_sender ||= request.remote_ip
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
          User.joins(:type_user).where('type_users.is_tech=1').each do |disp|
            unless disp.ip_addr.blank?
              send_notif(disp.ip_addr, @response.sender.name + ' ' +
              @response.sender.surname + ' a envoyé un message !')
            end
          end
        else
          unless @response.receiver.ip_addr.blank?
            send_notif(@response.receiver.ip_addr, @response.sender.name + ' ' +
             @response.sender.surname + ' a envoyé un message !')
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
          begin
            @response.receiver_id.nil? ? nil : AppMailer.incident_replied_for_tech_if_disp_answered(@incident, @users, @response).deliver_now
          rescue
            nil
          end
          begin
            AppMailer.incident_replied_for_creator_if_disp_answered(@incident, @users, @response).deliver_now
          rescue
            nil
          end
          begin
            AppMailer.incident_replied_for_disp_if_disp_answered(@incident, @users, @response).deliver_now
          rescue
            nil
          end
        else
          begin
            AppMailer.incident_replied_for_sender(@incident, @users, @response).deliver_now
          rescue
            nil
          end
          begin
            @response.receiver_id.nil? ? nil : AppMailer.incident_replied_for_receiver(@incident, @users, @response).deliver_now
          rescue
            nil
          end
          begin
            AppMailer.incident_replied_for_disp(@incident, @users, @response).deliver_now
          rescue
            nil
          end
        end
        flash[:notice] = 'Votre message a bien été envoyé.'
        redirect_to edit_incident_path(@incident)
      when 'Rejeter' then
        reject_it(@incident)
      when 'Réaffecter' then
        reaffect_it(@incident)
      when 'Cloturer' then
        cloture_it(@incident)
      end
    else
      respond_to do |format|
        format.json { render json: 'Response.save! ne marche pas', status: 409 }
        format.html { redirect_to :edit_incident, notice: "Impossible de cloturer l'incident ..." }
      end
    end
  end

  # Must reject the incident and send emails.
  def reject_it(incident)
    # Update the params of the incident.
    incident.update(incident_state_id_for_techœ_id: 10, incident_state_id_for_user_id: 10)
    # Get all the answers of the incident (for archive them).
    @responses = Response.all.where(incident_id: incident.id)
    archivage
    begin
      AppMailer.incident_rejected_for_creator(incident, @users).deliver_now
    rescue
      nil
    end
    User.joins(:type_user).where('type_users.is_tech=1').each do |disp|
      unless disp.ip_addr.blank?
        send_notif(disp.ip_addr, "L'incident n°" + incident.id.to_s + ' a été rejeté !')
    end
    end
    unless incident.user.ip_addr.blank?
      send_notif(incident.user.ip_addr, 'Votre incident n°' + incident.id.to_s + ' a été rejeté !')
    end
    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to edit_incident_path(incident), notice: 'Votre demande de rejet a bien été prise en compte.' }
    end
  end

  # Must cloture the incident, and send emails to the dispatchor and the user.
  def cloture_it(incident)
    # Get all the users for send the email.
    @users = User.all
    # Get all the answers of the incident (for archive them).
    @responses = Response.all.where(incident_id: incident.id)
    if incident.tech_id.nil?
      respond_to do |format|
        format.json { render json: 'Veuillez affecter un technicien avant de cloturer cet incident.', status: 409 }
        format.html { redirect_to edit_incident_path(incident), notice: 'Veuillez affecter un technicien avant de cloturer cet incident.' }
      end
      return false
    end
    # If is current_user that cloture his incident.
    if incident.user_id == current_user.id
      unless incident.tech.ip_addr == ''
        # Send the notification to the tech if the tech have the app installed.
        send_notif(incident.tech.ip_addr, "L'incident n°" + incident.id.to_s + ' a été cloturé !')
      end
      incident.update(resolved_at: Time.now, archived_at: Time.now, incident_state_id_for_tech_id: 7, incident_state_id_for_user_id: 7)
      archivage
      # Begin rescue is for if send fail.
      begin
        # Send email to the creator if is creator who have clotured.
        AppMailer.incident_clotured_for_creator_if_is_creator_clotured(incident, @users, @responses).deliver_now
      rescue
        nil
      end
      # Begin rescue is for if send fail.
      begin
        # Send email to the tech if is creator who have clotured.
        AppMailer.incident_clotured_for_tech_if_is_creator_clotured(incident, @users).deliver_now
      rescue
        nil
      end
    else # Or if is tech that have ask for a cloturation.
      unless incident.user.ip_addr.blank?
        # Send the notification to the user if the user have the app installed.
        send_notif(incident.user.ip_addr, 'Votre incident n°' + incident.id.to_s + ' demande à être cloturé !')
      end
      incident.update(resolved_at: Time.now, incident_state_id_for_tech_id: 9, incident_state_id_for_user_id: 8)
      @response.save!
      # Begin rescue is for if send fail.
      begin
        # Send the email to the user that have created the incident.
        AppMailer.incident_clotured_for_creator_if_is_tech_clotured(incident, @users, @responses).deliver_now
      rescue
        nil
      end
      # Begin rescue is for if send fail.
      begin
        # Send the email to the tech that have clotured the incident.
        AppMailer.incident_clotured_for_tech_if_is_tech_clotured(incident, @users).deliver_now
      rescue
        nil
      end
    end
    respond_to do |format|
      format.json do
        render json: 'Votre demande de cloture a bien été prise en compte.',
               status: 200
      end
      format.html do
        redirect_to :edit_incident,
                    notice: 'Votre demande de cloture a bien été prise en compte.'
      end
    end
  end

  # Do the archivation of the answers and for her files.
  def archivage
    @responses.each do |response|
      # Create a new archive with the sames values.
      @archive = Archive.new(
        content: response.content,
        incident_id: response.incident_id,
        sender_id: response.sender_id,
        receiver_id: response.receiver_id,
        ip_address_sender: response.ip_address_sender,
        pc_id: response.pc_id
      )
      # Check if the answer does not have files.
      # And if not, it goes after the .each.
      next if response.file_responses.nil?
      response.file_responses.each do |a|
        # Create an identic file respon to the file_archive.
        @file_archives = FileArchive.new(
          archive_id: response.id,
          file: a.file
        )
        # If the file is saved.
        if @file_archives.save!
          # It destroy the own file.
          a.destroy
          # Or ...
        else
          respond_to do |format|
            format.json do
              render json: "Une erreur est apparue lors de
              l'archivage des fichiers de l'incident. Merci de contacter votre
              administrateur en lui fournissant ces informations
              : #{@file_archives.inspect} ------ #{response.inspect}
              ------ #{incident.inspect}",
                     status: 409
            end
            format.html do
              redirect_to :back,
                          notice: "Une erreur est
                          apparue lors de l'archivage des fichiers de l'incident. Merci de
                          contacter votre administrateur en lui fournissant ces informations
                           : #{@file_archives.inspect} ------ #{response.inspect}
                           ------ #{incident.inspect}"
            end
          end
        end
      end
      # If the archive of the answer is saved.
      if @archive.save!
        # It destroy the own answer.
        response.destroy!
        # Or ...
      else
        respond_to do |format|
          format.json do
            render json: "Une erreur est apparue lors de l'archivage
             de l'incident. Merci de contacter votre administrateur en lui
              fournissant ces informations : #{@file_archives.inspect}
              ------ #{response.inspect} ------ #{incident.inspect}",
                   status: 409
          end
          format.html do
            redirect_to :back, notice: "Une erreur est apparue lors de
             l'archivage de l'incident. Merci de contacter votre administrateur
             en lui fournissant ces informations : #{@file_archives.inspect}
             ------ #{response.inspect} ------ #{incident.inspect}"
          end
        end
      end
    end
  end

  # Must update the incident with null technician.
  def reaffect_it(incident)
    incident.update(incident_state_id_for_tech_id: 1)
    incident.update(incident_state_id_for_user_id: 1)
    begin
      # Send the email to the dispatchor.
      AppMailer.incident_reaffected_for_disp(incident, @users).deliver_now
    rescue
      nil
    end
    # Must find the dispatchors.
    User.joins(:type_user).where('type_users.is_tech=1').each do |disp|
      next if disp.ip_addr.blank?
      # Try to send the notification to his app.
      send_notif(disp.ip_addr, "L'incident n°" + incident.id.to_s +
      ' demande a être réaffecté !')
    end
    respond_to do |format|
      format.json do
        render json: 'Votre demande de réaffectation a bien '\
        'été prise en compte.',
               status: 200
      end
      format.html do
        redirect_to :edit_incident,
                    notice: 'Votre demande de réaffectation a bien été'\
                    ' prise en compte.'
      end
    end
  end
end
