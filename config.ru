require 'byebug'
require 'json'
require 'rack'
require 'sequel'

require_relative './error_handler'
require_relative './auth'
require_relative './router'

DB = Sequel.connect(ENV['DATABASE_URL'])
require_relative './app'

class NotFoundError < StandardError; end

use Rack::CommonLogger

use ErrorHandler
use Auth

run Router.new
