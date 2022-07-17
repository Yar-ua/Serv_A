require_relative './app/loader'

use Rack::Reloader

require 'logger'

@logger = Logger.new(STDOUT)

# class Racker
#   def call(env)
#     request = Rack::Request.new(env)
#     puts request.host
#     puts request.body
#     # puts request.headers

#     response = Rack::Response.new('We use Rack::Response! Yay!', 555)
#     response.finish
#   end
# end

# run Racker.new

run App