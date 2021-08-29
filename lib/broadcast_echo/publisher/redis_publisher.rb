require 'redis'
require 'json'

module BroadcastEcho
  module Publisher
    class RedisPublisher
      attr_accessor :config

      def initialize(args)
        @config = args[:config]
      end

      def process
        redis = Redis.new(host: config.host, port: config.port, db: config.database)

        redis.publish "private-channel", {msg: "abc"}.to_json
      end
    end
  end
end
