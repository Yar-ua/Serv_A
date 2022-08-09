module Middleware
  class HeaderMiddleware
    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, body = @app.call(env)
      headers['Content-Type'] = 'application/json'
      headers['X-Service-Name'] = Config::SERVICE_NAME
      [status, headers, body]
    end
  end
end
