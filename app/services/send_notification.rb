# I don't understand this part of code very well, I think it can be refactored
# send_notification.rb
class SendNotification
  def initialize(host:, msg:)
    @host = host
    @msg = msg
    @port = '3333'
    @timeout = 3
  end

  def call; end

  private

  def send_notif
    # Convert the passed host into structures the non-blocking calls
    # Can deal with
    addr = Socket.getaddrinfo(@host, nil)
    sockaddr = Socket.pack_sockaddr_in(@port, addr[0][3])

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
        if IO.select(nil, [socket], nil, @timeout)
          begin
            # Verify there is now a good connection
            socket.connect_nonblock(sockaddr)
            socket.puts(@msg)
          rescue Errno::EISCONN
            # Good news everybody, the socket is connected!
            socket.puts(@msg)
          rescue Errno::ENETUNREACH
            # No internet access
            nil
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
      rescue Errno::ENETUNREACH
        nil
      end
    end
  end
end
