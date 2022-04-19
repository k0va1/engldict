require_relative "./request_dispatcher"
require_relative "../config/app"

class Server
  def self.run!
    Telegram::Bot::Client.run(ENV.fetch("TELEGRAM_BOT_API_TOKEN"), logger: ApplicationLogger.new) do |bot|
      dispatcher = RequestDispatcher.new(bot)

      bot.listen do |message|
        dispatcher.call(message)
      end
    end
  end
end
