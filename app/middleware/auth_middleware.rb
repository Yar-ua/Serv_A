include LoadLogger

module Middleware
  class AuthMiddleware
    def initialize(app, status = Constants::CODE_401)
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
      message = { error: 'unauthorized' }.to_json
      log(:warn, message, Constants::CODE_401)
      [@status, {}, [message]]
    end

    def authenticated?
      @request.params['API_TOKEN'] == Config::API_TOKEN
    end

    def auth_location?
      Config::AUTH_URLS.include?(@request.path)
    end
  end
end
