require "pusher"

module BroadcastEcho
  module Publisher
    class PusherPublisher
      attr_accessor :config

      def initialize(args)
        @config = args[:config]
      end

      def process
        pusher_client = Pusher::Client.new(
          app_id: "1258075",
          key: "b4c7a9603681d70b3ab4",
          secret: "28c988cba9f16fcbb27c",
          cluster: "ap1"
        )

        pusher_client.trigger(['my-channel-1'], 'my-event', {
          message: 'hello world'
        })
      end
    end
  end
end
