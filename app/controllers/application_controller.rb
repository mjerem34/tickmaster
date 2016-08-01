class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  skip_before_filter :verify_authenticity_token

  include SessionsHelper

  private

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
