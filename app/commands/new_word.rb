require_relative "./base"

module Commands
  class NewWord < Base
    TEXT = "Enter english word:".freeze

    private

    def handle_call(message)
      current_user.new_word!
      send_message(
        chat_id: message.chat.id,
        text: TEXT,
        parse_mode: :markdown
      )
    end
  end
end
