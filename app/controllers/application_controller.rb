class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  include SessionsHelper
  def test_exception
    raise "Testing, 1 2 3."
  end

  def sendNotif(host, msg, timeout = 3)
    port = "3333"
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

  # def sendNotif(host, msg)
    # host = @incident.user.ip_addr
    # connect(host, port, msg)
  #   begin
  #   s = TCPSocket.open(host, port)
  #   s.puts(msg)
  #   s.close
  # rescue ExceptionName
  # end
  # end
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

  def reaffect_it(incident) # fait repasser lincident a l'etat en attente daffectation
    incident.update(incident_state_id_for_tech_id: 1)
    incident.update(incident_state_id_for_user_id: 1)
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

  def cloture_it(incident)
    @users = User.all # Recuperation de tous les users pour email
    @responses = Response.all.where(incident_id: incident.id) # Recuperation toutes les reponses de lincident
    if incident.user_id == current_user.id # Si celui qui cloture est celui qui a cree lincident
          unless incident.tech.ip_addr == "" then
            sendNotif(incident.tech.ip_addr, "L'incident n°" + incident.id.to_s + " a été cloturé !")
          end
      incident.update(
        resolved_at: Time.now, archived_at: Time.now,
        incident_state_id_for_tech_id: 7,
        incident_state_id_for_user_id: 7)

      @responses.each do |response| # Pour chaque reponse
        @archive = Archive.new( # Creer une archive avec contenu identique
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
          unless incident.user.ip_addr.nil? then
            sendNotif(incident.user.ip_addr, "Votre incident n°" + incident.id.to_s + " demande à être cloturé !")
          end

      incident.update( # Met a jour l'incident : en attente de cloture
        resolved_at: Time.now, incident_state_id_for_tech_id: 9,
        incident_state_id_for_user_id: 8)
      @response.save!
      AppMailer.incident_clotured_for_creator_if_is_tech_clotured(incident, @users, @responses).deliver_now
      AppMailer.incident_clotured_for_tech_if_is_tech_clotured(incident, @users).deliver_now
      AppMailer.incident_clotured_for_disp_if_is_tech_clotured(incident, @users).deliver_now
    end
    redirect_to current_user
  end

  def create_subcats
    @sous_category = SousCategory.new
    respond_to do |format|
      format.js
    end
  end

end
