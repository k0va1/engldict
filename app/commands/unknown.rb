require_relative "./base"

module Commands
  class Unknown < Base
    TEXT = "Didn't understand you".freeze

    private

    def handle_call(message)
      send_message(
        chat_id: message.chat.id,
        text: TEXT,
        parse_mode: :markdown
      )
    end
  end
end
