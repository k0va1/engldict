require "forwardable"

class ApplicationLogger
  extend Forwardable

  def initialize
    @logger = Logger.new($stdout)
  end

  def_delegators :@logger, :info, :error, :debug, :fatal, :warn
end
