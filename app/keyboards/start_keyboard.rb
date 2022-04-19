require_relative "./keyboard_helpers"

module Keyboards
  class StartKeyboards
    include KeyboardHelpers

    def call
      reply_keyboard(
        [button("✏️ New word"), button("📘All words")]
      )
    end
  end
end
