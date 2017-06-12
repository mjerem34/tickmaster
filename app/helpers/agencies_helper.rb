module AgenciesHelper
  def exec_ping(host)
    return 0 if host == 'NULL'
    @icmp = Net::Ping::ICMP.new(host)
    @icmp.ping ? (@icmp.duration * 1000).round(1) : 0
  end
end
