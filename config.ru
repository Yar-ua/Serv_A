require_relative './app/loader'

use Rack::Reloader
use Middleware::HeaderMiddleware
use Middleware::AuthMiddleware

run App
