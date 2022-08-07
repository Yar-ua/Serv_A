include LoadLogger

module Middleware
  class AuthMiddleware
    attr_reader :status

    def initialize(app, status = 401)
      @app = app
      @status = status
    end

    def call(env)
      @request = Rack::Request.new(env)
      return unauthorized if !authenticated? && auth_location?

      @app.call(env)
    end
    
    private
    
    def unauthorized
      message = {"error": "unauthorized"}.to_json
      log(:warn, message)
      [@status, {}, StringIO.new(message)] 
    end

    def authenticated?
    #   @request.session.key?(:web_game)
      false
    end

    def auth_location?
      Config::AUTH_URLS.include?(@request.path)
    end
  end
end
