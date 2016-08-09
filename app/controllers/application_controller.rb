class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token
  before_filter :maj_flash_from_params

  include SessionsHelper

  private

  def default_url_options
    { maj_flash: @maj_flash }
  end

  def maj_flash_from_params
    @maj_flash = params[:maj]
  end

  def set_expiration
    expires_in(10.seconds, public: true)
  end

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
        flash[:notice] = "Votre message a bien été envoyé."
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

  def sendNotif(host, msg, timeout = 3)
    port = '3333'
    # Convert the passed host into structures the non-blocking calls
    # can deal with
    addr = Socket.getaddrinfo(host, nil)
    sockaddr = Socket.pack_sockaddr_in(port, addr[0][3])

    Socket.new(Socket.const_get(addr[0][0]), Socket::SOCK_STREAM, 0).tap do |socket|
      socket.setsockopt(Socket::IPPROTO_TCP, Socket::TCP_NODELAY, 1)

      begin
        # Initiate the socket connection in the background. If it doesn't fail
        # immediatelyit will raise an IO::WaitWritable (Errno::EINPROGRESS)
        # indicating the connection is in progress.
        socket.connect_nonblock(sockaddr)

      rescue IO::WaitWritable
        # IO.select will block until the socket is writable or the timeout
        # is exceeded - whichever comes first.
        if IO.select(nil, [socket], nil, timeout)
          begin
            # Verify there is now a good connection
            socket.connect_nonblock(sockaddr)
            socket.puts(msg)
          rescue Errno::EISCONN
            # Good news everybody, the socket is connected!
            socket.puts(msg)
          rescue
            # An unexpected exception was raised - the connection is no good.
            socket.close
          end
        else
          # IO.select returns nil when the socket is not ready before timeout
          # seconds have elapsed
          socket.close
          # raise "Connection timeout"
        end
      end
    end
  end

  def verifRight(right)
    if Right.where(name: right).pluck(current_user.tech.name).join('') == 'true'
      return true
    else
      return false
    end
  end

  def reject_it(incident)
    # Met a jour les params de l'incident pour indiquer qu'il est cloture
    incident.update(incident_state_id_for_techœ_id: 10, incident_state_id_for_user_id: 10)
    @responses = Response.all.where(incident_id: incident.id) # Recupere toutes les reponses de l'incident
    archivage
    begin
      AppMailer.incident_rejected_for_creator(incident, @users).deliver_now
    rescue
      nil
    end
    User.where(tech_id: 5).each do |disp|
      unless disp.ip_addr.nil?
        sendNotif(disp.ip_addr, "L'incident n°" + incident.id.to_s + " a été rejeté !")
      end
    end
    unless incident.user.ip_addr.nil?
      sendNotif(incident.user.ip_addr, "Votre incident n°" + incident.id.to_s + " a été rejeté !")
    end
    respond_to do |format|
      format.json { head :no_content, status: 200 }
      format.html { redirect_to :edit_incident, notice: "Votre demande de rejet a bien été prise en compte." }
    end
  end

  def cloture_it(incident)
    @users = User.all # Recuperation de tous les users pour email
    @responses = Response.all.where(incident_id: incident.id) # Recuperation toutes les reponses de lincident
    if incident.tech_id.nil?
      respond_to do |format|
        format.json { render json: 'Veuillez affecter un technicien avant de cloturer cet incident.', status: 409 }
        format.html { redirect_to :edit_incident, notice: 'Veuillez affecter un technicien avant de cloturer cet incident.' }
      end
      return false
    end
    if incident.user_id == current_user.id # Si celui qui cloture est celui qui a cree lincident
      unless incident.tech.ip_addr == ''
        sendNotif(incident.tech.ip_addr, "L'incident n°" + incident.id.to_s + " a été cloturé !")
      end
      incident.update(resolved_at: Time.now, archived_at: Time.now, incident_state_id_for_tech_id: 7, incident_state_id_for_user_id: 7)
      archivage
      begin
        AppMailer.incident_clotured_for_creator_if_is_creator_clotured(incident, @users, @responses).deliver_now
      rescue
        nil
      end
      begin
        AppMailer.incident_clotured_for_tech_if_is_creator_clotured(incident, @users).deliver_now
      rescue
        nil
      end
    else # Sinon si celui qui cloture est le technicien en charge
      unless incident.user.ip_addr.nil?
        sendNotif(incident.user.ip_addr, "Votre incident n°" + incident.id.to_s + " demande à être cloturé !")
      end
      incident.update(resolved_at: Time.now, incident_state_id_for_tech_id: 9, incident_state_id_for_user_id: 8)
      @response.save!
      begin
        AppMailer.incident_clotured_for_creator_if_is_tech_clotured(incident, @users, @responses).deliver_now
      rescue
        nil
      end
      begin
        AppMailer.incident_clotured_for_tech_if_is_tech_clotured(incident, @users).deliver_now
      rescue
        nil
      end
      # AppMailer.incident_clotured_for_disp_if_is_tech_clotured(incident, @users).deliver_now rescue nil
    end
    respond_to do |format|
      format.json { render json: "Votre demande de cloture a bien été prise en compte.", status: 200 }
      format.html { redirect_to :edit_incident, notice: "Votre demande de cloture a bien été prise en compte." }
    end
  end

  def archivage
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
          respond_to do |format|
            format.json { render json: "Une erreur est apparue lors de l'archivage des fichiers de l'incident. Merci de contacter votre administrateur en lui fournissant ces informations : #{@file_archives.inspect} ------ #{response.inspect} ------ #{incident.inspect}", status: 409 }
            format.html { redirect_to :back, notice: "Une erreur est apparue lors de l'archivage des fichiers de l'incident. Merci de contacter votre administrateur en lui fournissant ces informations : #{@file_archives.inspect} ------ #{response.inspect} ------ #{incident.inspect}" }
          end
        end
      end
      if @archive.save! # Si reponse archivee sauvegardee
        response.destroy! # Destruction de l'ancienne
      else
        respond_to do |format|
          format.json { render json: "Une erreur est apparue lors de l'archivage de l'incident. Merci de contacter votre administrateur en lui fournissant ces informations : #{@file_archives.inspect} ------ #{response.inspect} ------ #{incident.inspect}", status: 409 }
          format.html { redirect_to :back, notice: "Une erreur est apparue lors de l'archivage de l'incident. Merci de contacter votre administrateur en lui fournissant ces informations : #{@file_archives.inspect} ------ #{response.inspect} ------ #{incident.inspect}" }
        end
      end
    end
  end

  def reaffect_it(incident) # fait repasser lincident a l'etat en attente daffectation
    incident.update(incident_state_id_for_tech_id: 1)
    incident.update(incident_state_id_for_user_id: 1)
    begin
      AppMailer.incident_reaffected_for_disp(incident, @users).deliver_now
    rescue
      nil
    end
    User.where(tech_id: 5).each do |disp|
      unless disp.ip_addr.nil?
        sendNotif(disp.ip_addr, "L'incident n°" + incident.id.to_s + " demande a être réaffecté !")
      end
    end
    respond_to do |format|
      format.json { render json: "Votre demande de réaffectation a bien été prise en compte.", status: 200 }
      format.html { redirect_to :edit_incident, notice: "Votre demande de réaffectation a bien été prise en compte." }
    end
  end

  def renderUnauthorized
    @title = "Accès non autorisé"
    respond_to do |format|
      format.json { render json: "Vous n'avez pas l'autorisation d'accéder à cette page", status: 403 }
      format.html { redirect_to '/', not_authorized: "Vous n'avez pas l'autorisation d'accéder à cette page" }
    end
  end

  def restrict_access
    if current_user.nil?
      respond_to do |format|
        format.json { render json: "Vous devez être connecté pour accéder à cette page", status: 401 }
        format.html { redirect_to '/', not_authorized: "Vous devez être connecté pour accéder à cette page" }
      end
    end
  end

  def redirect_to_back(default = '/')
    if !request.env['HTTP_REFERER'].blank? && request.env['HTTP_REFERER'] != request.env['REQUEST_URI']
      redirect_to :back
    else
      redirect_to default
    end
  end

  def send_mails_delayed
    @mails = Mail.all
  end
end
