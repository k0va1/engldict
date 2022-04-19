require "bundler"
require_relative "./application_logger"
require "active_record"

Bundler.require
Dotenv.load

env = ENV["APP_ENV"] || "development"
config = YAML.load(File.open("config/database.yml"))[env]
ActiveRecord::Base.establish_connection(config)

root = Bundler.root
Dir.glob(root.join("app/**/*.rb")).each { |f| require f }
