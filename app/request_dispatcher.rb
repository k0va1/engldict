class RequestDispatcher
  def initialize(bot)
    @bot = bot
    @commands = {
      "/start" => Commands::Start.new(@bot.api),
      "/new_word" => Commands::NewWord.new(@bot.api)
    }
    @fallback = Commands::Unknown.new(@bot.api)
  end

  def call(message)

    case message
    when Telegram::Bot::Types::Message
      dispatch_message(message)
    when Telegram::Bot::Types::CallbackQuery
      dispatch_callback(message)
    end
  end

  private

  def dispatch_message(message)
    current_user = Utils::CurrentUser.new.call(message)
    if current_user.idle?
      command = message.text
      handler = @commands.fetch(command, @fallback)
      handler.call(message)
    else
      dispatch_word_adding(current_user, message)
    end
  end

  def dispatch_word_adding(current_user, message)
    if current_user.new_word?
      Commands::AddWord.new(@bot.api).call(message)
    elsif current_user.new_translation?
      #      Commands::AddTranslation.new(@bot.api).call(message)
    end
  end
end
