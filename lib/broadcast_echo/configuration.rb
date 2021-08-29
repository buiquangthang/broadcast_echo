class Configuration
  attr_accessor :url, :host, :password, :port, :database, :broadcast_driver

  def initialize
    @url = nil
    @host = "127.0.0.1"
    @password = nil
    @port = 6379
    @database = 0
    @broadcast_driver = :pusher
  end
end
