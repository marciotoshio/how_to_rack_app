require 'byebug'
require 'rack'

require_relative './app'
require_relative './auth'
require_relative './card_authorization'
require_relative './not_found'

class NotFoundError < StandardError; end

use Rack::CommonLogger

use Auth
use NotFound

run App.new
