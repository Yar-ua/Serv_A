require_relative './app/loader'

use Rack::Reloader
use Middleware::HeaderMiddleware

run App
