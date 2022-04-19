require_relative "./base"

module Commands
  class AddWord < Base
    TEXT = "Enter word translation:".freeze

    private

    def handle_call(message)
      current_user.words.create!(value: message.text)
      current_user.add_word!
      send_message(
        chat_id: message.chat.id,
        text: TEXT,
        parse_mode: :markdown
      )
      current_user.add_translation!
    end
  end
end
