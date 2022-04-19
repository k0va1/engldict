require "forwardable"

module Commands
  class Base
    extend Forwardable

    def initialize(api)
      @api = api
    end

    def call(message)
      @current_user = Utils::CurrentUser.new.call(message)

      handle_call(message)
    end

    private

    def_delegators :@api, :send_message

    def current_user
      @current_user
    end

    def handle_call
      raise NotImplementedError, "you need to implement #handle_call method"
    end
  end
end
