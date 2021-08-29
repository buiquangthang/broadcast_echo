# frozen_string_literal: true

require_relative "broadcast_echo/version"
require_relative "broadcast_echo/configuration"
require_relative "broadcast_echo/publisher/redis_publisher"
require_relative "broadcast_echo/publisher/pusher_publisher"

module BroadcastEcho
  class PublishData
    class << self
      attr_accessor :configuration
    end

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.reset
      @configuration = Configuration.new
    end

    def self.configure
      yield(configuration)
    end

    def self.publish(data: nil)
      case configuration.broadcast_driver
      when :pusher
        BroadcastEcho::Publisher::PusherPublisher.new(config: configuration).process
      else
        BroadcastEcho::Publisher::RedisPublisher.new(config: configuration).process
      end
    end
  end
end
